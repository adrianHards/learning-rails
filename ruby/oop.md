### block 
anonymous functions that can be passed into methods code that you put inside the do and end keywords (or { and } for inline blocks). It allows you to group code into a standalone unit that you can use as a method argument.

- anonymous functions that can be passed into methods
- enclosed in a do-end statement or curly braces {} for inline blocks
- they can have multiple arguments: these are defined between two pipe | characters

```ruby
# Form 1: recommended for single line blocks
[1, 2, 3].each { |num| puts num }
                 ^^^^^ ^^^^^^^^
                 block   block
               arguments body
```

### yield
calls the code inside the block and runs it

```ruby

def iterate(array)
  for element in array
    yield(element)
  end
end

numbers = [1, 2, 3]

iterate(numbers) do |num|
  puts num
end
```

**its value**: yield is commonly used to implement reusable code patterns. For example, a method might define the basic structure of an iteration but the specific actions to be performed on each iteration are passed as a block to the method.
