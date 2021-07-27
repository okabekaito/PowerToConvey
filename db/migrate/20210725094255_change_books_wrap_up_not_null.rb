class ChangeBooksWrapUpNotNull < ActiveRecord::Migration[5.2]

  def up
    change_column :books,:wrapUp,text, limit:150
  end

  def down
    change_column :books, :wrapUp,text
  end

  def change
    change_column_null :books, :wrapUp,false
  end
end
