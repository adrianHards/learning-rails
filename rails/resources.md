#### custom routes
Use get method to define a route that maps the URL /contact to the contact action of the PagesController:
```ruby
get 'contact', to: 'pages#contact'
``` 

```ruby
# erb
<%= link_to 'Contact Us', contact_path %>
```
