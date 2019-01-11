module Saver 
  class TripSaver
    def self.save(driver, trip)
      driver.trips << trip
    end
  end
end