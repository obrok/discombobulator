require "discombobulator/version"
require "discombobulator/config"
require "discombobulator/dodge_attack"
require "discombobulator/super_call"
require "discombobulator/swap_globals"

$DISCOMBOBULATOR_SAFETY_FEATURE = 42

class Discombobulator
  def self.method_missing(meth, *args, &block)
    self.new.method_missing(meth, *args, &block)
  end

  def method_missing(meth, *args, &block)
    plugin = plugins.sample
    plugin.call(meth, *args, &block)
  end

  private
  def plugins
    Discombobulator::Config.instance.plugins
  end
end
