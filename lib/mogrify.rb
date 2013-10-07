class Hash
  def symogriform
    symogriformed = {}
    self.each do |key, value|
      symogriformed[symog(key)] = value.is_a?(Hash) ? value.symogriform : value
    end
    symogriformed
  end

  def symog key
    key.is_a?(String) ? key.to_sym : key
  end
end

module Enumerable
  def hashmogrify(&block)
    hash = {}
    self.each do |e|
      key, value = [*block.call(e), e]
      hash[key] = value
    end
    hash
  end
end

