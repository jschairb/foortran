module Foortran
  # http://fortranwiki.org/fortran/show/Keywords
  KEYWORDS = %w(end print program)
end

require_relative 'foortran/lexer'
require_relative 'foortran/parser'
require_relative 'foortran/token'
require_relative 'foortran/version'
