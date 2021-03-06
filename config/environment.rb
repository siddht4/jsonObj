# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
JsonObj::Application.initialize!

require 'memcache'
require 'cached_model'

memcache_options = {
  :c_threshold => 10_000,
  :compression => true,
  :debug => false,
  :namespace => 'jsonObj',
  :readonly => false,
  :urlencode => false
}

CACHE = MemCache.new memcache_options
CACHE.servers = 'localhost:11211'