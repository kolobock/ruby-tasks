class Array
  def rebuild!(&block)
    return self unless block_given?

    self.map! do |element|
      if element.is_a?(Array)
        element.rebuild!(&block)
      else
        if block.arity == 1
          block.call(element)
        elsif block.arity == 2
          block.call(element, self.size)
        else
          raise "#{__method__} does not support arity > 2! Feel free to extend it ;)"
        end
      end
    end
  end
end
