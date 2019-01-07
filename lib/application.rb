require_relative('services/messenger.rb')

class Application

  def initialize
    Service::Messenger.run
  end
end

Application.new