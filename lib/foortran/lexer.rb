module Foortran
  class Lexer
    KEYWORDS = %w(program)

    attr_accessor :source
    attr_reader   :tokens

    def self.tokenize(source)
      lexer = new(source)
      lexer.tokenize
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
          if KEYWORDS.include?(identifier)
            tokens << [identifier.upcase.to_sym, identifier]
          end

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
