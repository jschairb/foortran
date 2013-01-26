require 'treetop'

module Foortran
  class Parser
    DEFAULT_GRAMMAR = "foortran_90"

    attr_reader :grammar, :parser

    def self.parse(source, grammar = DEFAULT_GRAMMAR)
      parser = new(grammar)
      parser.parse(source)
    end

    def initialize(grammar)
      @grammar = grammar
      Treetop.load(grammar_path)
      @parser  = FoortranParser.new
    end

    def grammar_path
      File.join(File.dirname(__FILE__), "#{grammar}.treetop")
    end

    def parse(source)
      tree = parser.parse(source)
      raise Exception, "Parse error at: #{parser.index}" if tree.nil?
      return tree
    end
  end
end
