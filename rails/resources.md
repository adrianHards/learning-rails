#### Constraints
Constraints are used to add conditions to a route that must be satisfied for the route to match a given request:
```ruby
resources :posts, only: [:index], constraints: { method: :get }
```

#### Custom routes
Use get method to define a route that maps the URL /contact to the contact action of the PagesController:
```ruby
get 'contact', to: 'pages#contact'
``` 

```ruby
# erb
<%= link_to 'Contact Us', contact_path %>
```

#### Delete
In general, you should nest a resource if it belongs to or is owned by another resource. But in the case of DELETE, you only need to capture the ID of the child resource, and not the ID of the parent resource, so you can define the route outside of the nested block:

```ruby
resources :posts
delete '/posts/:id', to: 'posts#destroy', as: 'delete_post'
```
The as: `delete_post` option gives the route a named helper method, so you can generate links or redirects to it using `delete_post_path(:id)`.
