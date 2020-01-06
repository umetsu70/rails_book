class Members < ActiveRecord::Migration[5.2]
  def change
    add_column:name,:book_name,:book_status
    rename_column members :book,:book_status
  end
end
