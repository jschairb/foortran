require_relative '../spec_helper'

module Foortran
  describe Lexer do
    let(:lexer)  { Lexer.new(source) }
    let(:source) { get_source_file("helloworld.f90") }

    describe ".tokenize" do
      it "returns tokenized source" do
        Lexer.tokenize(source).must_equal lexer.tokenize
      end
    end

    describe ".new" do
      it "sets the source attribute" do
        lexer.source.must_equal source
      end
    end

    describe "#add_identifier_token" do
      it "adds an identifier token to the tokens" do
        identifier_token = Token.identifier("helloworld")
        lexer.add_identifier_token("helloworld")
        lexer.tokens.must_include(identifier_token)
      end
    end

    describe "#add_keyword_token" do
      it "adds a keyword token to the tokens" do
        keyword_token = Token.keyword("program")
        lexer.add_keyword_token("program")
        lexer.tokens.must_include(keyword_token)
      end
    end

    describe "#add_string_token" do
      it "adds a string token to the tokens" do
        string_token = Token.string("helloworld")
        lexer.add_string_token("helloworld")
        lexer.tokens.must_include(string_token)
      end
    end

    describe "#add_token" do
      let(:token) { [:IDENTIFIER, "identifier"] }

      it "adds a token to the collection" do
        token_count = lexer.tokens.size
        lexer.add_token(token)
        lexer.tokens.size.must_equal(token_count +1)
      end
    end

    describe "#tokenize" do
      let(:tokens) { lexer.tokenize }

      it "returns a collection of tokens" do
        puts tokens.inspect
        skip "Unless how to test the collection"
        expected_tokens = [
          Token.keyword("program"),
          Token.keyword("program")
        ]
        tokens.must_equal(expected_tokens)
      end
    end
  end
end
