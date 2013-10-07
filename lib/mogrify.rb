require "minitest/autorun"
class Hash
  def symogriform
    symogriformed = {}
    symogrified = self
    symogrified.keys.each do |key|
      if symogrified[key].is_a?(Hash)
        symogrified[key] = symogrified[key].symogriform
      end
    end
    symogriformed.merge!(symogrify(symogrified))
    symogriformed
  end

  def symogrify part
    part.keys.inject({}){|hash, key| hash.merge({symog(key) => part[key]})}
  end

  def symog key
    key.is_a?(String) ? key.to_sym : key
  end
end

module Enumerable
  def hashmogrify(&block)
    hash = {}
    self.each do |e|
      result = block.call(e)
      if result.is_a?(Array)
        hash[result[0]] = result[1]
      else
        hash[result] = e
      end
    end
    hash
  end
end

