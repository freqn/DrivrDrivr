require_relative '../../app/helpers/calculate.rb'
require_relative '../../app/models/trip.rb'
require_relative '../spec_helper.rb'

RSpec.describe Calculate do

  before do
    TripData = Struct.new(:command, :driver, :depart, :arrive, :dist)
  end

  let(:trip_data_1) { TripData.new("Trip", "Joe", "1:30pm", "3:30pm", "130")}
  let(:trip_data_2) { TripData.new("Trip", "Joe", "12:30pm", "3:30pm", "210")}

  let(:trip_1) { Model::Trip.new(1, trip_data_1) }
  let(:trip_2) { Model::Trip.new(2, trip_data_2) }

  let(:trips) {[trip_1, trip_2]}

  context "trips total distance" do
    it 'calculates the total miles' do
      expect(Calculate.total_miles(trips)).to eq(340)
    end
  end

  context "trips average speed" do
    it 'calculates the average speed' do
      expect(Calculate.avg_speed(trips)).to eq(68)
    end
  end
end
