require 'time'

module Model     
  class Trip
    attr_reader :driver, 
                :depart, 
                :arrive, 
                :dist, 
                :speed, 
                :driver_id
    
    def initialize(id, data)
      @driver = data.driver
      @depart = Time.parse(data.depart)
      @arrive = Time.parse(data.arrive)
      @dist   = data.dist
      @speed  = get_speed
      @driver_id = id
    end

    private 

    def get_speed
      Calculate.speed(dist, depart, arrive)
    end

  end
end