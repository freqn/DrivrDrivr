module Saver 
  class DriverTrips
    attr_reader :driver, :trip, :speed

    def initialize(driver, trip)
      @trip   = trip
      @driver = driver
      @speed  = trip.speed
    end

    def save
      save_trip if valid_trip?
    end

    def valid_trip?
      speed > 5 || speed < 100
    end

    def save_trip
      driver.trips << trip
    end
  end
end