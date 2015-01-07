# Sprockets::Bowerrc

Adds your bower directory to your Sprockets asset path.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sprockets-bowerrc'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sprockets-bowerrc

## Usage

### Rails

`config/initializers/assets.rb`

```ruby
Rails.application.config.assets.configure do |env|
    env.append_bowerrc
end
```

This will append the bower directory determined by your bowerrc file to your asset path. You can instead use ```env.prepend_bowerrc``` to add it to the front.

### Rack

```ruby
require 'sprockets'
require 'sprockets-bower'
map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_bowerrc
  run environment
end
```

This will append the bower directory determined by your bowerrc file to your asset path. You can instead use ```environment.prepend_bowerrc``` to add it to the front.


## Contributing

1. Fork it ( https://github.com/casao/sprockets-bowerrc/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
