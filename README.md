# Sprockets::Bower

Adds your bower directory to your Sprockets asset path.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sprockets-bower'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sprockets-bower

## Usage

### Rails

`config/initializers/assets.rb`

```ruby
Rails.application.config.assets.configure do |env|
    env.use_bowerrc
end
```

### Rack

```ruby
require 'sprockets'
require 'sprockets-bower'
map '/assets' do
  environment = Sprockets::Environment.new
  environment.use_bowerrc
  run environment
end
```

## Contributing

1. Fork it ( https://github.com/casao/sprockets-bower/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
