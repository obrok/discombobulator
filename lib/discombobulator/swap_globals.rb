Discombobulator::Config.instance.add_plugin(
  ->(meth, *args, &block) do
    begin
      name1, name2 = global_variables.sample, global_variables.sample
      temp = eval(name1.to_s)
      eval("#{name2} = #{name1}")
      eval("#{name1} = temp")
      Discombobulator.new
    rescue NameError, SyntaxError, TypeError, ArgumentError
      retry
    end
  end
)
