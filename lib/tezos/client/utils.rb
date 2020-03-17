
class Hash
  def stringify_keys
    self.map do |k, v|
      [k.to_s, v]
    end.to_h
  end
end

