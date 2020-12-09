module Truncate
  def self.extended(klass)
    klass.class_eval do
      private
        def truncate!(attr, len)
          orig_attr = self.public_send(:"original_#{attr}").to_s
          return orig_attr if orig_attr.length <= len

          orig_attr[0..len.to_i - 1].concat('...')
        end
    end
  end

  def truncate(attr, length:)
    alias_method :"original_#{attr}", :"#{attr}"
    define_method :"#{attr}" do
      truncate! attr, length
    end
  end
end
