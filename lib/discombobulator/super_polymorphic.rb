class Discombobulator::SuperPolymorphic
  def self.call(meth, *args, &block)
    self.new.call(meth, *args, &block)
  end

  def call(meth, *args, &block)
    method = find_me_a_method(meth, args.length)
    no_method_error(meth) unless method
    if $DISCOMBOBULATOR_SAFETY_FEATURE == 42
      p "Calling the BEST '##{method.name}' with #{args.inspect}"
    else
      method.call(*args, &block)
    end
  end

  private
  def no_method_error(name)
    raise NoMethodError, "Dude, what have you been smoking? I could not find a single appropriate '#{name}' to call."
  end

  def find_me_a_method(name, arity)
    name = name.to_sym
    ObjectSpace.each_object.to_a.shuffle.each do |obj|
      method = obj.method(name) rescue nil
      return method if method && method.arity == arity
    end
    nil
  end
end

Discombobulator::Config.instance.add_plugin(Discombobulator::SuperPolymorphic)
