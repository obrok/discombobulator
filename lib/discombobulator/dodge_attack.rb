class Discombobulator
  class DodgeAttack
    def self.call(meth, *args, &block)
      puts "You made it this time!"
      Discombobulator.new
    end
  end
end

Discombobulator::Config.instance.add_plugin(Discombobulator::DodgeAttack)
