require_relative('services/messenger.rb')
class Application

  def self.run
    Service::Messenger.new(ARGF)
  end
end

Application.run