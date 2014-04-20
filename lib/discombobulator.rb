require 'method_struct'

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


[
  'cosmic_rays',
  'dodge_attack',
  'pseudo_random',
  'super_call',
  'super_polymorphic',
  'swap_globals',
].each do |plugin|
  require_relative "discombobulator/#{plugin}"
end
