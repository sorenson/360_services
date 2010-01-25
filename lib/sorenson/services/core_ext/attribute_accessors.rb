class Class
  def cattr_reader(*syms)
    syms.flatten.each do |sym|
      next if sym.is_a?(Hash)
      class_eval(<<-EOS, __FILE__, __LINE__)
        unless defined? @@#{sym}  # unless defined? @@hair_colors
          @@#{sym} = nil          #   @@hair_colors = nil
        end                       # end
                                  #
        def self.#{sym}           # def self.hair_colors
          @@#{sym}                #   @@hair_colors
        end                       # end
                                  #
        def #{sym}                # def hair_colors
          @@#{sym}                #   @@hair_colors
        end                       # end
      EOS
    end
  end

  def cattr_writer(*syms)
    syms.flatten.each do |sym|
      class_eval(<<-EOS, __FILE__, __LINE__)
        unless defined? @@#{sym}                       # unless defined? @@hair_colors
          @@#{sym} = nil                               #   @@hair_colors = nil
        end                                            # end
                                                       #
        def self.#{sym}=(obj)                          # def self.hair_colors=(obj)
          @@#{sym} = obj                               #   @@hair_colors = obj
        end                                            # end
                                                       #
      EOS
    end
  end

  def cattr_accessor(*syms)
    cattr_reader(*syms)
    cattr_writer(*syms)
  end
end