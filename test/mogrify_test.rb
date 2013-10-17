$:.unshift File.join(File.dirname(__FILE__),'..','lib') 
require 'mogrify'
require "minitest/autorun"

describe Hash do
  describe "symogriform" do
    it "should not modify nested hashes" do
      hash = { "inner" => { "A" => :a, "B" => :b } }
      hash.symogriform
      hash.must_equal({ "inner" => { "A" => :a, "B" => :b } })
    end

    it "should convert keys to symbols" do
      {"A" => :a, "B" => :b}.symogriform.must_equal({A: :a, B: :b}) 
    end

    it "should convert keys at arbitrary layers to symbols" do
      {"A" => {"A" => "a"}, "B" => {"B" => {"C" => {}}}}.symogriform.must_equal({A: {A: "a"}, B: {B: {C: {}}}})
    end

    it "should ignore non-string keys" do
      {1 => "a", 2 => "a"}.symogriform.must_equal({1 => "a", 2 => "a"})
    end
  end
end

describe "Enumerable#to_hash" do
  it "creates a hash from any enumerable object" do
    [].hashmogrify(&:whatever).must_be_instance_of Hash
  end
  it "uses an object attribute to create the keys for the hash" do
    ["foo", "barr", "bazzz"].hashmogrify(&:length).keys.must_equal [3,4,5]
  end
  it "can accept a block to define a custom key function" do
    hash = ["foo", "bar", "baz"].hashmogrify { |s| s.reverse }
    hash.keys.must_equal ["oof", "rab", "zab"]
  end

  it "sets the values in the hash to the enumerated objects" do
    hash = ["foo", "bar", "baz"].hashmogrify { |s| s.reverse }
    hash.values.must_equal ["foo", "bar", "baz"]
  end

  it "can accept a block to define both the keys and the values in the hash" do
    hash = ["foo", "barr", "bazzz"].hashmogrify { |s| [s, s.length] }
    hash.must_equal({
      "foo" => 3,
      "barr" => 4,
      "bazzz" => 5
    })
  end
end
