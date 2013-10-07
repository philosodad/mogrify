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

