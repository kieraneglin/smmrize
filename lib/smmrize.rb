require "cgi"
require "net/http"
require "json"

require "smmrize/version"
require "smmrize/request_types/webpage"
require "smmrize/request_types/document"

module Smmrize
  class Defaults
    class << self
      attr_writer :api_key, :client_name

      def api_key
        @api_key or raise Exception.new "Smmrize::Defaults API Key is not set"
      end

      def api_url
        'http://api.smmry.com/'
      end
    end
  end
end
