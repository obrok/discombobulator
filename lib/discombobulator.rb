$DISCOMBOBULATOR_SAFETY_FEATURE = 42

class Discombobulator < BasicObject
end

require "discombobulator/config"

class Discombobulator < BasicObject
  def self.method_missing(meth, *args, &block)
    self.new.method_missing(meth, *args, &block)
  end

  def method_missing(meth, *args, &block)
    plugin = plugins.sample
    plugin.call(meth, *args, &block)
  end

  private
  def plugins
    ::Discombobulator::Config.instance.plugins
  end
end

require "discombobulator/dodge_attack"
require "discombobulator/super_call"
require "discombobulator/swap_globals"
