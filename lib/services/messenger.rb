require_relative './message_router.rb'
require_relative './reporter.rb'

module Service
  class Messenger

    def self.run
      route_messages(build_params(ARGF))
    end

    private

    def self.build_params(text)
      @params, @id = {}, 0
      text.each do |t|
        objectify(t)
      end
      @params
    end
    
    Message = Struct.new(:command, :driver, :depart, :arrive, :dist)
    
    def self.objectify(msg)
      msg = msg.split
      @id += 1 unless msg.empty?
      @params[@id] = Message.new(*msg)
    end

    def self.route_messages(params)
      MessageRouter.new(params).send
    end
  end
end

Service::Messenger.run