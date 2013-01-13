require_relative "../test_helper"

module Foortran
  class LexerTest < MiniTest::Unit::TestCase
    def test_class_tokenize_returns_tokens
      lexer = Lexer.new(@source)
      assert_equal Lexer.tokenize(@source), lexer.tokenize
    end
    
    def test_new_sets_source_attribute
      lexer = Lexer.new(@source)
      assert_equal lexer.source, @source
    end
  end
end
