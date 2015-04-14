require "sidekiq"
require "sidekiq_remote_enqueuer/version"

module Sidekiq
  class RemoteEnqueuer
    def self.enqueue_to(queue, klass, *args)

      item = { queue: queue, class: klass.to_s, retry: false, args: args}

      pushed = false
      payload = Sidekiq.dump_json(item)

      Sidekiq.redis do |conn|
        _, pushed = conn.multi do
          conn.sadd('queues', queue)
          conn.rpush("queue:#{queue}", payload)
        end
      end
      !!pushed
    end
  end
end
