require 'singleton'

module Rocketman
  module Adapter
    class Memory
      include Singleton

      def initialize
        @registry = {}
      end

      def register_event(event)
        if @registry[event]
          return @registry[event]
        else
          @registry[event] = {}
        end
      end

      def register_consumer(event, consumer, action)
        @registry[event][consumer] = action
      end

      def get_events
        @registry.keys
      end

      def get_consumers_for(event)
        @registry[event]
      end

      def event_exists?(event)
        !@registry[event].nil?
      end
    end
  end
end
