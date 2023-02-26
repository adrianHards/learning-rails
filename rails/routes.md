```ruby
#%i[new create]
resources :users, only: [:new, :create] do 
  resources :posts, except: [:destroy]
end
resources :posts, only: [:destroy]
```

#### Member and Collection
```ruby
resources :users do
  member do
    get 'profile'
  end

  collection do
    get 'search'
  end
end
```

##### Member
The profile route is added to the member block, which means it operates on a single user. This route maps to the profile action in the UsersController, and can be accessed via the URL `/users/:id/profile`. For example, if the id of the user is 123, the URL would be `/users/123/profile`.

##### Collection
The search route is added to the collection block, which means it operates on the entire collection of users. This route maps to the search action in the UsersController, and can be accessed via the URL /users/search. 

```ruby
def search
  @posts = Post.where("title LIKE ? OR body LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")

  if params[:tag].present?
    @posts = @posts.tagged_with(params[:tag])
  end
end
```

#### Manually
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
