# Discombobulator

https://github.com/obrok/discombobulator

Don't you hate seeing this in your face when working on your next $1,000,000,000 startup idea?

```
NoMethodError: undefined method `+' for nil:NilClass
```

Don't you hate when people keep calling methods you clearly marked as [DEPRECATED] in the source code?

```
NOTE: Gem.source_index is deprecated, use Specification. It will be removed on or after 2011-11-01.
```

Well fear no more, discombobulator is here to save the day!

```ruby
gem 'discombobulator'

class NilClass
  def method_missing(meth, *args, &block)
    Discombobulator.new.call(meth, *args, &block)
  end
end

class Gem

  # READ TEH SOURCE CODEZ AND LOGZ. THIS IS [DEPRECATED].
  def source_index
    return Discombobulator.new if Time.now > Time.new(2011, 11, 01)
  end
end
```

# SHOULD I USE THIS IN MY SYSTEM?

Yes. I am being completely serious. You should.

Definitely.
