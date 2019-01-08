require_relative '../models/driver.rb'
require_relative '../models/trip.rb'
require_relative 'reporter.rb'

module Service
  class MessageRouter
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
      puts row
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
        raise "Skipping - Invalid Command"
      end
    end

    def register_driver(driver_data)
      @driver_id += 1
      record = Model::Driver.new(@driver_id, driver_data)
      @drivers[@driver_id] = record
    end

    def register_trip(trip_data)
      @trip_id += 1
      driver = trip_data.driver
      record = Model::Trip.new(driver_id(driver), trip_data)
      @trips[@trip_id] = record
    end

    def driver_id(name)
      driver = drivers.select { |k, v| v.name == name }
      driver.values[0].id
    end

    def add_trips_to_drivers(result)
      result[:drivers].each do |k, v|
        result[:trips].each do |x, y|
          if v.id == y.driver_id
            v.trips << y
          end
        end
      end
    end

    def create_report(driver_data)
      Reporter.new(driver_data).generate
    end
  end
end