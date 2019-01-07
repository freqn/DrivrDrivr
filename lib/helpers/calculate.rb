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

  def self.speed(distance, depart, arrive)
    (distance.to_f / (travel_time(depart, arrive) / 60)).round
  end

  def self.travel_time(depart, arrive)
    ((arrive - depart) / 60)
  end
end