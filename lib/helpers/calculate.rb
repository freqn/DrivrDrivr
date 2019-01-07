class Calculate
  
  def self.total_miles(trips)
    sum = 0
    trips.each do |trip|
      sum += trip.dist.to_f
    end
    rounder(sum)
  end

  def self.avg_speed(trips)
    speeds = []
    trips.each do |trip|
      speeds << trip.speed
    end
    rounder(average(speeds))
  end

  def self.rounder(value)
    value.round
  end

  def self.average(speeds)
    speeds.inject{ |sum, speed| sum + speed }.to_f / speeds.size
  end
end