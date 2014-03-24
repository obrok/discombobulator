class Discombobulator::CosmicRays
  def self.call(meth, *args, &block)
    self.new.call(meth, *args, &block)
  end

  def call(meth, *args, &block)
    if object = find_me_a_victim
      name = object.instance_variables.shuffle.find{ |var| is_a_number?(object, var) }
      cosmic_ray_flip_flop(object, name)
    end

    Discombobulator.new
  end

  def cosmic_ray_flip_flop(object, name)
    value = object.instance_variable_get(name)
    new_value = Flipper.new(value).call
    if $DISCOMBOBULATOR_SAFETY_FEATURE == 42
      p "Changing #{object.class} #{name} from #{value} to #{new_value}"
    else
      object.instance_variable_set(name, new_value)
    end
  end

  def find_me_a_victim
    ObjectSpace.each_object.to_a.shuffle.each do |obj|
      return obj if has_a_number?(obj)
    end
    nil
  end

  def has_a_number?(obj)
    obj.instance_variables.any?{ |name| is_a_number?(obj, name) }
  end

  def is_a_number?(obj, name)
    obj.instance_variable_get(name).kind_of?(Integer)
  end

  class Flipper
    def initialize(value)
      @value = value
    end

    def call
      method = [ :evil_flip, :complement, :cosmic_storm, :rescue_what_you_can, :trust_no_one ].shuffle.first
      send(method)
    end

    private
    attr_reader :value

    def evil_flip
      debug 'Evil flip'
      value ^ 1
    end

    def complement
      debug 'Complement'
      ~value
    end

    def cosmic_storm
      debug 'Cosmic storm'
      rand(max_integer)
    end

    def rescue_what_you_can
      debug 'Rescue what you can'
      value & rand(max_integer)
    end

    def trust_no_one
      debug 'Trust no one'
      value ^ rand(max_integer)
    end

    def max_integer
      bytes = [42].pack('i').size
      bits = bytes * 16
      2 ** (bits - 2) - 1
    end

    def debug(msg)
      p msg if $DISCOMBOBULATOR_SAFETY_FEATURE == 42
    end
  end
end

Discombobulator::Config.instance.add_plugin(Discombobulator::CosmicRays)
