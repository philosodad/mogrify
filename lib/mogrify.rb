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

  def hashmogrificate(&block)
    hash = {}
    known_keys = []
    self.each do |e|
      key, value = [*block.call(e), e]
      if known_keys.include? key
        hash[key] << value
      elsif hash[key]
        hash[key] = [hash[key]] << value
        known_keys << key
      else
        hash[key] = value
      end
    end
    hash
  end
end

