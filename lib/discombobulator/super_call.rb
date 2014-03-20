class Discombobulator
  class SuperCall
    def self.call(meth, *args, &block)
      self.new.call(meth, *args, &block)
    end

    def call(meth, *args, &block)
      method = find_me_a_method(args.length)
      if $DISCOMBOBULATOR_SAFETY_FEATURE == 42
        p "CALLING: #{method.name} with #{args.inspect}"
      else
        method.call(*args, &block)
      end
    end

    private
    def find_me_a_method(arity)
      ObjectSpace.each_object.to_a.shuffle.each do |obj|
        obj.methods.shuffle.each do |name|
          method = obj.method(name)
          return method if method.arity == arity
        end
      end
    end
  end
end

Discombobulator::Config.instance.add_plugin(Discombobulator::SuperCall)
