class ChangeBooksTitleNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column :books,:title,string, limit:30
  end

  def down
    change_column :books, :title,string
  end
  def change
    change_column_null :books, :title,false
  end
end
