require_relative "converter"
require "test/unit"
 
class TestSimpleNumber < Test::Unit::TestCase
 
  def test_simple
    assert_equal([["motortruck"], ["onto", "struck"], 
                  ["noun", "struck"], ["nouns", "usual"], 
                  ["nouns", "truck"], ["motor", "usual"], 
                  ["motor", "truck"]], Converter.new('dictionary.txt').convert(6686787825) )


    assert_equal([["catamounts"], ["cat", "contour"], 
      ["cat", "amounts"], ["bat", "contour"], ["bat", "amounts"], 
      ["act", "contour"], ["act", "amounts"], ["acta", "mounts"]], Converter.new('dictionary.txt').convert(2282668687) )
  end
 
end