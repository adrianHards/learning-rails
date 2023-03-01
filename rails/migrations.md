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
  change_column :bookings, :content, :text
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
#### Rename a table
`rails generate migration RenameOldTableNameToNewTableName`
```ruby
def change
  rename_table :old_table_name, :new_table_name
end
```

#### Rename a column
`rails generate migration RenameOldColumnNameToNewColumnNameInTableName`
```ruby
def change
  rename_column :table_name, :old_column_name, :new_column_name
end
```
#### If all else fails ...
1. delete your `schema.rb` file
2. edit existing migration files as needed
3. `rails db:drop`
4. `rails db:create db:migrate`
