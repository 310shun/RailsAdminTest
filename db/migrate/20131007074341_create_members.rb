class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :user_id
      t.integer :group_id
      t.references :user, index: true
      t.references :group, index: true

      t.timestamps
    end
  end
end
