require_relative('services/message_handler.rb')
class Application

  def self.run(data)
    Service::MessageHandler.new(data)
  end
end

Application.run(ARGF)