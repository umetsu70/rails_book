class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name  #利用者名
      t.string :book_name #書名
      t.string :book_status #本の状態(借りる、返却)

      t.timestamps
    end
  end
end
