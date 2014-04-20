class Discombobulator::PseudoRandom
  def self.call(meth, *args, &block)
    if $DISCOMBOBULATOR_SAFETY_FEATURE == 42
      puts "Messing with your RNG!"
    else
      Kernel::srand(42)
    end
    Discombobulator.new
  end
end

Discombobulator::Config.instance.add_plugin(Discombobulator::PseudoRandom)
