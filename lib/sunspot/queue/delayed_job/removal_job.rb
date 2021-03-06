require "sunspot/queue/helpers"

module Sunspot::Queue::DelayedJob
  class RemovalJob < Struct.new(:klass, :id)
    include ::Sunspot::Queue::Helpers

    def perform
      without_proxy do
        ::Sunspot.remove_by_id(klass, id)
      end
    end

    def queue_name
      Sunspot::Queue.configuration.queue_name
    end
  end
end
