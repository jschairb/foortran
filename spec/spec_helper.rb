require 'rspec'
require 'foortran'

RSpec.configure do |c|
end

def get_source_file(filename)
  path = "./spec/support/src/#{filename}"
  File.open(path).read
end
