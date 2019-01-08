require_relative "../helpers/calculate.rb"

module Service
  class Reporter
    def initialize(data)
      @data         = data
      @report_data  = []
    end

    def generate
      build_file(report_data)
    end

    private

    def report_data
      @data.each do |k, v|
        build_report(v)
      end
      @report_data.sort_by { |x| x.total_miles }.reverse
    end
    
    def build_report(v)
      driver = v.name
      if v.trips.empty?
        total_miles, avg_speed = 0,0
      else
        total_miles = Calculate.total_miles(v.trips)
        avg_speed   = Calculate.avg_speed(v.trips)
      end
      structify(driver, total_miles, avg_speed)
    end

    ReportData = Struct.new(:driver, :total_miles, :avg_speed)
    
    def structify(driver, miles, speed)
      @report_data << ReportData.new(driver, miles, speed)
    end

    def build_file(driver_data)
      location = "../output.txt"
      File.open(location, 'w') do |file| 
        write_file(driver_data, file)
      end
    end
    
    def write_file(driver_data, file)
      driver_data.each do |x|
        if x.total_miles > 0
          line = "#{x.driver}: #{x.total_miles} miles @ #{x.avg_speed} mph\n"
        else
          line = "#{x.driver}: #{x.total_miles} miles"
        end
        file.write(line)
      end
    end
  end
end
