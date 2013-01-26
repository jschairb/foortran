require 'spec_helper'

module Foortran
  describe Parser do 
    let(:grammar) { "foortran_90" }
    let(:parser)  { Parser.new(grammar) }

    describe ".new" do 
      it "sets the grammar attribute" do 
        expect(parser.grammar).to eq(grammar)
      end
    end
  end
end
