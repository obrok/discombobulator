require "discombobulator/version"
require "discombobulator/config"

Discombobulator::Config.instance.add_plugin(lambda { puts "You made it this time" })

class Discombobulator
  def method_missing(_)
    plugins.sample.call
    Discombobulator.new
  end

  private
  def plugins
    Discombobulator::Config.instance.plugins
  end
end
