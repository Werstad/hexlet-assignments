# frozen_string_literal: true
# BEGIN
require 'uri'
require 'forwardable'

class Url
    extend Forwardable
    include Comparable
    def_delegators :@url, :host, :scheme, :port
    attr_accessor :url, :query_params

    def initialize(url)
        @url = URI(url)
        @params = params(url)
    end

    def params(url)
        return {} if @url.query == nil
        @url.query.split('&').each_with_object({}) do |item, acc|
          acc[item.split('=')[0].to_sym] = item.split('=')[1]
        end
    end

    def query_params
        @params
    end

    def query_param(key, default = nil)
      query_params[key.to_sym].nil? ? default : query_params[key.to_sym]
    end

    def <=> (obj)
      [url.scheme, url.host, url.port, query_params] <=> [obj.scheme, obj.host, obj.port, query_params]
    end

end
# END
