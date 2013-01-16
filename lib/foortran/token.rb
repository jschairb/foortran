module Foortran
  class Token
    attr_accessor :name, :value

    def self.identifier(value)
      token = new(:identifier, value)
      token.to_ary
    end

    def self.keyword(name)
      token = new(name, name)
      token.to_ary
    end

    def self.string(value)
      token = new(:string, value)
      token.to_ary
    end

    def initialize(name, value)
      self.name  = name
      self.value = value
    end

    def formatted_name
      name.to_s.upcase.to_sym
    end

    def formatted_value
      value
    end

    def to_ary
      [ formatted_name, formatted_value ]
    end
  end
end
