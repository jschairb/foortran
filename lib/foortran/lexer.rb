module Foortran
  class Lexer
    IDENTIFIER_REGEX = /\A(\*|[a-z]\w*)/
    STRING_REGEX     = /\A"(.*?)"/

    attr_accessor :source
    attr_reader   :tokens

    def self.tokenize(source)
      lexer = new(source)
      lexer.tokenize
    end

    def add_identifier_token(token)
      add_token(Token.identifier(token))
    end

    def add_keyword_token(token)
      add_token(Token.keyword(token))
    end

    def add_string_token(token)
      add_token(Token.string(token))
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

        if identifier = chunk[IDENTIFIER_REGEX, 1]
          if KEYWORDS.include?(identifier)
            add_keyword_token(identifier)
          else
            add_identifier_token(identifier)
          end
          i += identifier.size
        elsif string = chunk[STRING_REGEX, 1]
          add_string_token(string)
          i += string.size + 2 # for the quotes
        else
          i += 1
          next
        end
      end
      tokens
    end
  end
end
