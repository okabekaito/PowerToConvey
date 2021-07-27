class ChangeBooksAuthorNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column :books,:author,string, limit:30
  end

  def down
    change_column :books, :author,string
  end
  
  def change
    change_column_null :books, :author,false
  end
end
