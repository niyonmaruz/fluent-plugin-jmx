# coding: utf-8
require 'json'
require 'fluent/plugin/input'
module Fluent::Plugin
  class OsqueryInput < Fluent::Plugin::Input
    Fluent::Plugin.register_input('jmx', self)

    helpers :timer

    config_param :tag, :string, default: 'jmx'
    config_param :interval, :integer, default: 60
    config_param :url, :string, default: 'http://127.0.0.1:8778/jolokia'
    config_param :mbean, :string, default: 'java.lang:type=Memory'
    config_param :attribute, :string, :default => nil
    config_param :inner_path, :string, :default => nil

    unless method_defined?(:router)
      define_method("router") { Fluent::Engine }
    end

    def initialize
      super
      require 'net/http'
      require 'uri'
    end

    def configure(conf)
      super
    end

    def start
      super
      timer_execute(:in_jmx, interval, &method(:execute))
    end

    def shutdown
      super
    end

    private

    def execute
      @time = Fluent::Engine.now
      record = _get_record
      log.debug(record)
      router.emit(@tag, @time, record)
    rescue => e
      @log.error('faild to run', error: e.to_s, error_class: e.class.to_s)
      @log.error_backtrace
    end

    def _get_record
      record = Hash.new(0)
      uri = URI.parse("#{@url}/read/#{@mbean}/#{@attribute}")
      if @attribute && @inner_path
        uri = URI.parse("#{@url}/read/#{@mbean}/#{@attribute}/#{@inner_path}")
      end
      @log.debug(uri)
      Net::HTTP.start(uri.host, uri.port) do |http|
        request = Net::HTTP::Get.new(uri.request_uri)
        http.request(request) do |response|
          record = JSON.parse(response.body) rescue next
          record.delete("value"["Verbose"])
          @log.debug(response.body)
        end
      end
      record
    end
  end
end
