require 'spec_helper'

describe Sidekiq::RemoteEnqueuer do

  describe '.enqueue_to' do

    let(:queue) { 'queue' }
    let(:worker_class) { 'MyWorker' }
    let(:args) { ['arg1', 'arg2'] }
    let(:expected) { {'queue' => queue, 'class' => worker_class, 'retry' => false, 'args'=> args} }

    it 'enqueues the given data to redis' do
      Sidekiq::RemoteEnqueuer.enqueue_to(queue, worker_class, *args)

      Sidekiq.redis do |redis|
        expect(redis.sismember('queues', queue)).to be_truthy
        expect(JSON.parse(redis.lpop("queue:#{queue}"))).to eq expected
      end

    end

  end

end
