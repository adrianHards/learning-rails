```ruby
require 'ruby/debug'

def multiply(x, y)
  byebug # add a breakpoint here
  x * y
end

result = multiply(3, 4)
puts result
```

`step`: step into the next line of code <br>
`next`: step over the next line of code <br>
`finish`: finish executing the current method and return to the calling method <br>
`continue`: continue execution until the next breakpoint <br>
`break`: set a new breakpoint <br>
`info`: display information about the current state of the program <br>
