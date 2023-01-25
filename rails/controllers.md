# Controllers

#### .new or [.build](https://apidock.com/rails/v5.2.3/ActiveRecord/Associations/CollectionProxy/build)

In Ruby on Rails, the `.new` method is used to create a new instance of a model, while the `.build` method is used to create a new instance of a model that is part of an existing association. The difference between the two is subtle, but important to understand.

When you call `.new` with params, it will create a new instance of the model and assign the attributes specified in the params. For example: 

```ruby
user = User.new(name: 'John', email: 'john@example.com')
```
This will create a new instance of the User model, with the name attribute set to 'John' and the email attribute set to 'john@example.com'.

On the other hand, `.build` is typically used when you have an existing instance of a model and you want to create a new instance of another model that is associated with it.
For example, if you have an existing user object, you can use .build to create a new post object that is associated with that user.

```ruby
user = User.new(name: 'John', email: 'john@example.com')
post = user.posts.build(title: 'Hello World', body: 'This is my first post')
```
This will create a new instance of the Post model, with the title attribute set to 'Hello World' and the body attribute set to 'This is my first post', and it will also associate the post with the user by adding the user_id to the post's attributes.

In summary `.new` creates a new object that's not related to any other object, whereas `.build` creates a new object and associate it with another object, usually as part of an association.
