require_relative '../spec_helper'

module Foortran
  describe Token do
    let(:name)  { :string }
    let(:token) { Token.new(name, value) }
    let(:value) { "my-string" }

    describe ".identifier" do
      let(:identifier_token) { Token.new("identifier", "helloworld").to_ary }

      it "sets the value as the value" do
        expect(Token.identifier("helloworld")).to eq(identifier_token)
      end
    end

    describe ".keyword" do
      let(:keyword_token) { Token.new("program", "program").to_ary }

      it "sets the name as the value" do
        expect(Token.keyword("program")).to eq(keyword_token)
      end
    end

    describe ".string" do
      let(:string)       { "hello, world" }
      let(:string_token) { Token.string(string) }

      it "sets the name as string" do
        expect(string_token[0]).to eq(:STRING)
      end

      it "sets the value as the value" do
        expect(string_token[1]).to eq(string)
      end
    end

    describe ".new" do
      it "sets the name attribute" do
        expect(token.name).to eq(name)
      end

      it "sets the value attribute" do
        expect(token.value).to eq(value)
      end
    end

    describe "#formatted_name" do
      it "upcases and symbolizes the name" do
        expect(token.formatted_name).to eq(name.upcase.to_sym)
      end
    end

    describe "#formatted_value" do
      it "returns the value" do
        expect(token.formatted_value).to eq(value)
      end
    end

    describe "#to_ary" do
      it "returns a 2 item array with formatted name and value" do
        expect(token.to_ary).to eq([token.formatted_name, token.formatted_value])
      end
    end
  end
end
