## fluent-plugin-jmx

[jolokia](https://jolokia.org/) input plugin

## Installation

Add this line to your application's Gemfile:

    gem 'fluent-plugin-jmx'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fluent-plugin-jmx

When you use with td-agent, install it as below:

    $ sudo /opt/td-agent/embedded/bin/fluent-gem install fluent-plugin-jmx

## Configuration

### Example

    <source>
      @type jmx
      tag jmx.memory
      url http://127.0.0.1:8778/jolokia
      mbean java.lang:type=Memory
      attribute HeapMemoryUsage
      interval 60
      inner_path used
    </source>

    <match jmx.**>
      @type stdout
    </match>

## Copyright

Copyright (c) 2015 Hidenori Suzuki. See [LICENSE](LICENSE) for details.

