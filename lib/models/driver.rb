require 'pry'

module Model
  class Driver
    attr_reader :name, :id
    attr_accessor :trips

    def initialize(id, data)
      @name   = data.driver
      @id     = id
      @trips  = []
    end
  end
end