require_relative '../spec_helper'

module Foortran
  describe Token do
    let(:name)  { :string }
    let(:token) { Token.new(name, value) }
    let(:value) { "my-string" }

    describe ".keyword" do
      it "sets the name as the value" do
        keyword_token = Token.new("program", "program").to_ary
        Token.keyword("program").must_equal keyword_token
      end
    end

    describe ".new" do
      it "sets the name attribute" do
        token.name.must_equal name
      end

      it "sets the value attribute" do
        token.value.must_equal value
      end
    end

    describe "#formatted_name" do
      it "upcases and symbolizes the name" do
        token.formatted_name.must_equal name.upcase.to_sym
      end
    end

    describe "#formatted_value" do
      it "returns the value" do
        token.formatted_value.must_equal value
      end
    end

    describe "#to_ary" do
      it "returns a 2 item array with formatted name and value" do
        token.to_ary.must_equal [token.formatted_name, token.formatted_value]
      end
    end
  end
end
