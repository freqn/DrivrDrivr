require_relative '../models/driver.rb'
require_relative '../models/trip.rb'
require_relative '../savers/driver_trips.rb'
require_relative 'reporter.rb'

module Service
  class Dispatcher
    include Saver
    attr_reader :data, :drivers, :trips

    def initialize(messages)
      @data                = messages
      @drivers, @trips     = {}, {}
      @driver_id, @trip_id = 0, 0
    end

    def send
      1.upto(data.length) do |n|
        process_row(n)
      end
      process_result
    end
    
    private
    
    def process_row(n)
      row = data[n]
      send_row(row)
    end

    def process_result
      result = {drivers: drivers, trips: trips}
      add_trips_to_drivers(result)
      create_report(drivers)
    end
    
    def send_row(row)
      cmd = row.command
      command(cmd, row)
    end

    def command(cmd, row)
      case cmd
      when "Driver"
        register_driver(row)
      when "Trip"
        register_trip(row)
      else
        raise "ERROR - Input file commands must start with 'Driver' or 'Trip'"
      end
    end

    def register_driver(driver_data)
      @driver_id += 1
      record = Model::Driver.new(@driver_id, driver_data)
      drivers[@driver_id] = record
    end

    def register_trip(trip_data)
      @trip_id += 1
      driver = trip_data.driver
      record = Model::Trip.new(driver_id(driver), trip_data)
      trips[@trip_id] = record
    end

    def driver_id(name)
      driver = drivers.select { |k, v| v.name == name }
      driver.values[0].id
    end

    def add_trips_to_drivers(result)
      result[:drivers].each do |k, v|
        trips = result[:trips]
        driver_trips = trips.select {|x, y| y.driver_id == v.id}
        driver_trips.each { |id, trip| Saver::DriverTrips.new(v, trip).save }
      end
    end

    def create_report(driver_data)
      Reporter.new(driver_data).generate
    end
  end
end