require_relative '../models/driver.rb'
require_relative '../models/trip.rb'

require 'pry'

module Service
  class MessageRouter
    attr_reader :data, :drivers, :trips
    def initialize(messages)
      @data                 = messages
      @drivers, @trips      = {}, {}
      @driver_id, @trip_id = 0, 0
    end

    def send
      1.upto(data.length) do |n|
        row = data[n]
        puts row
        send_row(row, n)
      end
    end

    private
    
    def send_row(row, n)
      # binding.pry
      cmd = row.command
      case cmd
      when "Driver"
        register_driver(row)
      when "Trip"
        register_trip(row)
      else
        puts "Invalid Command"
      end
    end

    def register_driver(driver_data)
      @driver_id += 1
      drivers[@driver_id] = Model::Driver.new(@driver_id, driver_data)
    end

    def register_trip(trip_data)
      @trip_id += 1
      trips[@trip_id] = Model::Trip.new(@trip_id, trip_data)
    end
  end
end