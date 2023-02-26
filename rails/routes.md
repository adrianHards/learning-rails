#### Member and Collection
```ruby
resources :users do
  member do
    get :profile
  end

  collection do
    get :created_after
  end
end
```

##### Member
The profile route is added to the member block, which means it operates on a single user. This route maps to the profile action in the UsersController, and can be accessed via the URL `/users/:id/profile`. For example, if the id of the user is 123, the URL would be `/users/123/profile`.

##### Collection
The created_after route is added to the collection block, which means it operates on the entire collection of users. This route maps to the search action in the UsersController, and can be accessed via the URL /users/created_after. 

<br>

#### Custom route

`get 'users/:id/bookings', to: 'users#bookings', as: 'user_bookings'` <br>
`<%= link_to 'My Bookings', user_bookings_path(current_user) %>`

```ruby
# user controller
def bookings
  @user = User.find(params[:id])
  @bookings = @user.bookings
end
```
<br>

#### Manually
```ruby
#%i[new create]
resources :users, only: [:new, :create] do 
  resources :posts, except: [:destroy]
end
resources :posts, only: [:destroy]
```

```ruby
# Users
get    '/users/new',     to: 'users#new'
post   '/users',         to: 'users#create'
get    '/users/:id',     to: 'users#show',    as: 'user'
get    '/users/:id/edit',to: 'users#edit',    as: 'edit_user'
patch  '/users/:id',     to: 'users#update'
delete '/users/:id',     to: 'users#destroy'

# Posts
get    '/users/:user_id/posts',          to: 'posts#index'
post   '/users/:user_id/posts',          to: 'posts#create'
get    '/users/:user_id/posts/new',      to: 'posts#new',    as: 'new_post'
get    '/users/:user_id/posts/:id',      to: 'posts#show',   as: 'post'
get    '/users/:user_id/posts/:id/edit', to: 'posts#edit',   as: 'edit_post'
patch  '/users/:user_id/posts/:id',      to: 'posts#update'
delete '/posts/:id',                     to: 'posts#destroy', as: 'destroy_post'
```
In the case of the update action in Rails controllers, the default behavior is to use a PATCH request. 
PATCH verb is used to update an existing resource. Any fields that are not included in the request will be left unchanged.
