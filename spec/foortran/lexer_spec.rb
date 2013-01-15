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

    describe "#add_keyword_token" do
      it "adds a keyword token to the tokens" do
        keyword_token = Token.keyword("program")
        lexer.add_keyword_token("program")
        lexer.tokens.must_include(keyword_token)
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

      it "returns a keyword token" do
        tokens.must_include [:PROGRAM, "program"]
      end
    end
  end
end
