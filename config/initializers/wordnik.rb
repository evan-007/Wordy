Wordnik.configure do |config|
  config.api_key = '140d5096e0b95a369f404094a430bf5b7ed0dd3a2e0713eca'               # required
  # config.username = 'bozo'                    # optional, but needed for user-related functions
  # config.password = 'cl0wnt0wn'               # optional, but needed for user-related functions
  config.response_format = 'json'             # defaults to json, but xml is also supported
  config.logger = Logger.new('/dev/null')     # defaults to Rails.logger or Logger.new(STDOUT). Set to Logger.new('/dev/null') to disable logging.
end