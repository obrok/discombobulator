class Discombobulator
  class SwapGlobals
    def self.call(meth, *args, &block)
      self.new.call(meth, *args, &block)
    end

    def call(meth, *args, &block)
      name1, name2 = global_variables.shuffle.take(2)
      val1, val2 = get_global(name1), get_global(name2)
      set_global(name1, val2)
      set_global(name2, val1)
      Discombobulator.new
    rescue NameError, SyntaxError, TypeError, ArgumentError
      retry
    end

    private
    def get_global(name)
      eval(name.to_s)
    end

    def set_global(name, value)
      if $DISCOMBOBULATOR_SAFETY_FEATURE == 42
        puts "Setting global #{name} to #{value.inspect}"
      else
        eval("#{name} = value")
      end
    end
  end
end

Discombobulator::Config.instance.add_plugin(Discombobulator::SwapGlobals)
