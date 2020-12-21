class Array
  def rebuild!(&block)
    return self unless block_given?

    raise "#{__method__} does not support arity > 2! Feel free to extend it ;)" if block.arity > 2

    self.map! do |element|
      if element.is_a?(Array)
        element.rebuild!(&block)
      else
        yield(element, self.size)
      end
    end
  end
end
