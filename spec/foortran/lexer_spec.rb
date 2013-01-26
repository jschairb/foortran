require 'spec_helper'

module Foortran
  describe Lexer do
    let(:lexer)  { Lexer.new(source) }
    let(:source) { get_source_file("helloworld.f90") }

    describe ".tokenize" do
      it "returns tokenized source" do
        expect(Lexer.tokenize(source)).to eq(lexer.tokenize)
      end
    end

    describe ".new" do
      it "sets the source attribute" do
        expect(lexer.source).to eq(source)
      end
    end

    describe "#add_identifier_token" do
      let(:identifier_token) { Token.identifier("helloworld") }

      it "adds an identifier token to the tokens" do
        lexer.add_identifier_token("helloworld")
        expect(lexer.tokens).to include(identifier_token)
      end
    end

    describe "#add_keyword_token" do
      let(:keyword_token) { Token.keyword("program") }

      it "adds a keyword token to the tokens" do
        lexer.add_keyword_token("program")
        expect(lexer.tokens).to include(keyword_token)
      end
    end

    describe "#add_string_token" do
      let(:string_token) { Token.string("helloworld") }

      it "adds a string token to the tokens" do
        lexer.add_string_token("helloworld")
        expect(lexer.tokens).to include(string_token)
      end
    end

    describe "#add_token" do
      let(:token) { [:IDENTIFIER, "identifier"] }

      it "adds a token to the collection" do
        expect { lexer.add_token(token) }.to change(lexer.tokens, :size).by(1)
      end
    end

    describe "#tokenize" do
      let(:tokens) { lexer.tokenize }

      it "returns a collection of tokens" do
        pending "Unless how to test the collection"
        expected_tokens = [
          Token.keyword("program"),
          Token.keyword("program")
        ]
        tokens.must_equal(expected_tokens)
      end
    end
  end
end
