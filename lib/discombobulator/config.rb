require "singleton"

class Discombobulator::Config
  include Singleton

  def add_plugin(plugin)
    plugins << plugin
  end

  def plugins
    @plugins ||= []
  end
end
