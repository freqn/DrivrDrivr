require 'spec_helper'
RSpec.describe Service::Messenger do
    
  it 'should work' do
    expect(Service::Messenger.run).to_not be_nil
  end
end