module Foortran
  class Lexer
    KEYWORDS = [:program]

    attr_accessor :source

    def self.tokenize(source)
      lexer = new(source)
      lexer.tokenize
    end

    def initialize(source)
      self.source = source
    end

    def tokenize
    end
  end
end
