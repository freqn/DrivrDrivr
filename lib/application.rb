require_relative('services/message_handler.rb')

class Application
  def initialize(input)
    raise_error if input.empty?
    @data = File.read(input.first)
  end

  def run
    Service::MessageHandler.new(@data)
  end

  def raise_error
    raise "INPUT FILE REQUIRED"
  end
end

Application.new(ARGV).run