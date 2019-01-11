require_relative './message_dispatcher.rb'
require_relative './reporter.rb'

module Service
  class MessageHandler

    def initialize(data)
      route_messages(build_params(data))
    end

    private

    def build_params(text)
      @params, @id = {}, 0
      text.each do |t|
        t.include?("\n") ? t = t.delete("\n") : t
        objectify(t)
      end
      @params
    end
    
    Message = Struct.new(:command, :driver, :depart, :arrive, :dist)
    
    def objectify(msg)
      msg = msg.split
      @id += 1 unless msg.empty?
      @params[@id] = Message.new(*msg)
    end
    
    def route_messages(params)
      MessageDispatcher.new(params).send
    end
  end
end