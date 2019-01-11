require_relative '../../lib/models/driver.rb'
require_relative '../../lib/models/trip.rb'
require_relative '../../lib/savers/trip_saver.rb'
require_relative '../spec_helper.rb'

RSpec.describe Model::Trip do
  
  before do
    TripData = Struct.new(:driver,
                          :depart,
                          :arrive,
                          :dist,
                          :speed,
                          :driver_id)

    DriverData = Struct.new(:id,
                            :driver)
  end

  let(:driver_data) { DriverData.new(3, "Joe") } 
  let(:driver) { Model::Driver.new(3, driver_data)  } 

  let(:params) do 
    { driver: driver_data,
      depart: '7:08',
      arrive: '8:20',
      dist: 70,
      driver_id: driver.id }
  end

  let(:trip_data) do
    TripData.new(params[:driver],
                 params[:depart],
                 params[:arrive],
                 params[:depart],
                 params[:driver_id])
  end

  let(:trip) { Model::Trip.new(3, trip_data)  } 
  
  context 'when Trip' do
    it 'has a driver' do
      expect(trip.driver).to eq(params[:driver])
    end

    it 'adds the trip to the driver' do
      Saver::TripSaver.save(driver, trip)
      expect(driver.trips.first).to eq(trip)
    end
  end
end
