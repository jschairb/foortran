module Foortran
  class Lexer
    attr_accessor :source
    attr_reader   :tokens

    def self.tokenize(source)
      lexer = new(source)
      lexer.tokenize
    end

    def add_keyword_token(token)
      add_token(Token.keyword(token))
    end

    def add_token(token)
      tokens << token
    end

    def initialize(source)
      self.source = source
      @tokens     = []
    end

    def tokenize
      i = 0
      while i < source.size
        chunk = source[i..-1]

        if identifier = chunk[/\A([a-z]\w*)/, 1]
          add_keyword_token(identifier) if KEYWORDS.include?(identifier)
          i += identifier.size
        else
          i += 1
          next
        end
      end
      tokens
    end
  end
end
