require_relative '../../app/models/driver.rb'
require_relative '../spec_helper.rb'

RSpec.describe Model::Driver do
  
  before do
    DriverData = Struct.new(:id, :driver)
  end

  let(:driver_data) { DriverData.new(3, "Joe") } 
  let(:driver) { Model::Driver.new(3, driver_data)  } 
  
  it 'has a name' do
    expect(driver.name).to eq("Joe")
  end

  it 'has an id' do
    expect(driver.id).to eq(3) 
  end
end
