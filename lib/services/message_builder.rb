require_relative './message_router.rb'
require 'pry'

module Service
  class MessageBuilder

    def self.run
      params = build_params(ARGF)
      params
      MessageRouter.new(params).send
    end


    def self.build_params(text)
      @params, @id = {}, 0
      text.each do |t|
        objectify(t)
      end
      @params
    end
    
    Message = Struct.new(:command, :driver, :depart, :arrive, :dist)
    
    def self.objectify(msg)
      msg          = msg.split
      @id         += 1 unless msg.empty?
      @params[@id] = Message.new(*msg)
    end
  end
end

Service::MessageBuilder.run