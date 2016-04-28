module Smmrize
  def self.webpage(options={})
    raise ArgumentError, "Options should be a hash" unless options.is_a?(Hash)
    raise ArgumentError, "Maximum number of options are #{webpage_option_defaults.size}" unless options.size <= webpage_option_defaults.size

    send_webpage_request(options)
  end

  def self.send_webpage_request(options)
    url = prepare_webpage_options(options)
    response = Net::HTTP.get_response(URI(url))
    JSON.parse(response.body)
  end

  def self.prepare_webpage_options(options)
    raise ArgumentError, "Options must contain a URL" unless options.keys.include?(:url)
    options = webpage_option_defaults.merge(options)
    create_webpage_query_string(options)
  end

  def self.create_webpage_query_string(options)
    raise ArgumentError, "Unknown key in `options`" unless options.keys == webpage_option_defaults.keys
    query_string = "&SM_API_KEY=#{Smmrize::Defaults.api_key}&SM_LENGTH=#{options[:length]}&SM_KEYWORD_COUNT=#{options[:keywords]}"

    if options[:avoid_quotes]
      query_string += "&SM_QUOTE_AVOID"
    end

    if options[:with_break]
      query_string += "&SM_WITH_BREAK"
    end

    Smmrize::Defaults.api_url + query_string + "&SM_URL=#{CGI::escape(options[:url])}"
  end

  def self.webpage_option_defaults
    {
      url: nil,
      length: 7,
      keywords: 0,
      avoid_quotes: false,
      with_break: false
    }
  end
end
