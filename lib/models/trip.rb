require 'time'

module Model     
  class Trip
    attr_reader :trips, :depart, :arrive, :dist, :speed, :driver, :driver_id
    
    def initialize(id, data)
      @driver = data.driver
      @depart = Time.parse(data.depart)
      @arrive = Time.parse(data.arrive)
      @dist   = data.dist
      @speed  = calc_speed
      @driver_id = id
    end

    private

    def calc_speed
      (dist.to_f / (travel_time / 60)).round
    end

    def travel_time
      ((arrive - depart) / 60)
    end
  end
end