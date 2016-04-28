# Smmrize
A gem to simplify communication with [SMMRY](http://smmry.com/about)

Note: I am not affiliated with SMMRY or it's creators in any way.  Just a fan of their work.

# Installation

You know the drill!  For general use:

```
  gem install smmrize
```

If your project is using bundler, put this in your Gemfile:

```ruby
  gem 'smmrize'
```
Then run

```
bundle install
```
And you're off to the races!

# Config

There is some setup involved.  Thankfully, it's pretty simple.  You just need to set up your API key:

```ruby
Smmrize::Defaults.api_key = ENV['SMMRY_API_KEY']
```
If you're using Rails, you can add the above lines to an initializer file, e.g. `config/initializers/smmrize.rb`

# Usage

There are two types of requests that can be made, webpage and document.

### Webpage:

The only mandatory parameter is `url`, but there are several others you can set to suit your needs.  

Below are the possible options and their defaults.

```ruby
{
  url: nil, # String - The url you want to summarize
  length: 7, # Int - The number of sentences returned
  keywords: 0, # Int - The number of top keywords to return
  avoid_quotes: false, # Boolean - If true, result will not include quotations
  with_break: false # Boolean - If true, result will have `[BREAK]` between sentences.  Use `gsub` to replace with `<br>`, `\n`, etc,.
}
```

Once you know what options you need, begin a request like so:

```ruby
Smmrize.webpage(options)
```

#### Example:

```ruby
web_address = 'http://www.example.com/article'
summary = Smmrize.webpage(url: web_address, length: 4, with_break: true)
```

### Document:

The only mandatory parameter is `input`, but there are several others you can set to suit your needs.  

Below are the possible options and their defaults.

```ruby
{
  input: nil, # String-  The supplied text to summarize
  length: 7, # Int - The number of sentences returned
  keywords: 0, # Int - The number of top keywords to return
  avoid_quotes: false, # Boolean - If true, result will not include quotations
  with_break: false # Boolean - If true, result will have `[BREAK]` between sentences.  Use `gsub` to replace with `<br>`, `\n`, etc,.
}
```

Once you know what options you need, begin a request like so:

```ruby
Smmrize.document(options)
```

#### Example:

```ruby
text_to_summerize = 'Check out this super cool sentence!' # Note: it'll have to be way more text than that
summary = Smmrize.document(input: text_to_summerize, length: 4, with_break: true)
```

## Response:

Smmrize returns a Ruby hash, so using the example above you could access the content with

```ruby
  summary[:sm_api_content]
```

For a full list of possible responses, check out the [SMMRY API docs](http://smmry.com/api)

# Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kieraneglin/smmrize. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org/) code of conduct.

# License

The gem is available as open source under the terms of the [MITLicense](https://opensource.org/licenses/MIT).
