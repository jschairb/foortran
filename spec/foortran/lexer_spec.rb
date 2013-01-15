require_relative '../spec_helper'

module Foortran
  describe Lexer do 
    let(:lexer)  { Lexer.new(source) }
    let(:source) { "" }

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
  end
end
