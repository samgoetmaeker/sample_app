class AddEmailUniquenessIndex < ActiveRecord::Migration

  def change
    add_column :users, :email, :unique : true,:string
  end
end
