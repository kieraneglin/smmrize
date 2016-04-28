module Smmrize
  def self.document(options={})
    raise ArgumentError, "Options should be a hash" unless options.is_a?(Hash)
    raise ArgumentError, "Maximum number of options are #{document_option_defaults.size}" unless options.size <= document_option_defaults.size

    send_document_request(options)
  end

  def self.send_document_request(options)
    uri = URI(prepare_document_options(options))
    response = Net::HTTP.post_form(uri, 'sm_api_input': options[:input])
    JSON.parse(response.body)
  end

  def self.prepare_document_options(options)
    raise ArgumentError, "Options must not contain a URl - Did you mean to use `Smmrize.webpage?`" if options.keys.include?(:url)
    options = document_option_defaults.merge(options)
    create_document_query_string(options)
  end

  def self.create_document_query_string(options)
    raise ArgumentError, "Unknown key in `options`" unless options.keys == document_option_defaults.keys
    query_string = "&SM_API_KEY=#{Smmrize::Defaults.api_key}&SM_LENGTH=#{options[:length]}&SM_KEYWORD_COUNT=#{options[:keywords]}"

    if options[:avoid_quotes]
      query_string += "&SM_QUOTE_AVOID"
    end

    if options[:with_break]
      query_string += "&SM_WITH_BREAK"
    end

    Smmrize::Defaults.api_url + query_string
  end

  def self.document_option_defaults
    {
      input: nil,
      length: 7,
      keywords: 0,
      avoid_quotes: false,
      with_break: false
    }
  end
end
