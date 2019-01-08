require_relative('services/messenger.rb')
class Application

  def initialize(data)
    Service::Messenger.new(data)
  end
end

Application.new(ARGF)