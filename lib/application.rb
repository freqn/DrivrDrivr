require_relative 'services/receiver.rb'

class Application
  def initialize(input)
    raise_error if input.empty?
    @data = File.read(input.first)
  end

  def run
    Service::Receiver.new(@data)
  end

  def raise_error
    raise "INPUT FILE REQUIRED"
  end
end

Application.new(ARGV).run