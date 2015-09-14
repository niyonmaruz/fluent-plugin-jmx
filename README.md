## fluent-plugin-jmx

[jolokia](https://jolokia.org/) input plugin

## Installation

Add this line to your application's Gemfile:

    gem 'fluent-plugin-jmx'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fluent-plugin-jmx

## Configuration

### Example

    <source>
      type jmx
      tag jmx.memory
      url http://127.0.0.1:38778/jolokia
      mbean java.lang:type=Memory
      attribute HeapMemoryUsage
      interval 60
      inner_path used
    </source>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new [Pull Request](../../pull/new/master)

## Copyright

Copyright (c) 2015 Hidenori Suzuki. See [LICENSE](LICENSE) for details.

