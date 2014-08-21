# SidekiqRemoteEnqueuer

Simple Sidekiq Add-on to enqueue jobs to other applications.

## Installation

Add this line to your application's Gemfile:

    gem 'sidekiq_remote_enqueuer', :git => 'git@github.com:geisonbiazus/sidekiq-remote-enqueuer.git'

And then execute:

    $ bundle

## Usage

    Sidekiq::RemoteEnqueuer.enqueue_to 'queue', 'RemoteWorkerClass', args

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
