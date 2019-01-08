require_relative('services/messenger.rb')
class Application

  def self.run(data)
    Service::Messenger.new(data)
  end
end

Application.run(ARGF)