require "discombobulator/version"
require "discombobulator/config"
require "discombobulator/super_call"

$DISCOMBOBULATOR_SAFETY_FEATURE = 42

Discombobulator::Config.instance.add_plugin(
  ->(meth, *args, &block) do
    puts "You made it this time!"
    Discombobulator.new
  end
)

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
