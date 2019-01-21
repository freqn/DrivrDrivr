require_relative '../helpers/calculate.rb'
require 'time'

module Model     
  class Trip
    attr_reader :driver, 
                :depart, 
                :arrive, 
                :dist, 
                :speed, 
                :driver_id
    
    def initialize(driver_id, data)
      @driver = data.driver
      @depart = Time.parse(data.depart)
      @arrive = Time.parse(data.arrive)
      @dist   = data.dist.to_f
      @speed  = speed
      @driver_id = driver_id
    end

    def speed
      Calculate.speed(dist, depart, arrive)
    end

  end
end