require_relative 'test_helper'

class FoortranTest < MiniTest::Unit::TestCase

  def test_rake_file
    assert_kind_of Module, Foortran
  end
end
