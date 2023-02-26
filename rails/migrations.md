#### Add to an existing table
`rails generate migration AddAdminToUsers admin:boolean`

```ruby
def change
  add_column :users, :admin, :boolean, default: false
end
```

#### Update a column's data type
`rails generate migration ChangeColumnTypeInTable`

```ruby
def change
  change_column :table_name, :column_name, :text
end
```
#### Remove a column
`rails generate migration RemoveColumnFromTable`
```ruby
def change
  remove_column :table_name, :column_name
end
```
#### Add a foreign key
`rails generate migration AddForeignKeyToPosts`
```ruby
def change
  add_foreign_key :posts, :users
end
```
