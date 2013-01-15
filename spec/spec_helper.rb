gem 'minitest'
require 'minitest/autorun'

require 'foortran'

def get_source_file(filename)
  path = "./spec/support/src/#{filename}"
  File.open(path).read
end
