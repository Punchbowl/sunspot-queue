require "sunspot/queue/helpers"

module Sunspot::Queue::DelayedJob
  class IndexJob < Struct.new(:klass, :id)
    include ::Sunspot::Queue::Helpers

    def perform
      without_proxy do
        constantize(klass).find(id).solr_index
      end
    end

    def queue_name
      Sunspot::Queue.configuration.queue_name
    end
  end
end
