class ChangeUserIdToNullableInBugs < ActiveRecord::Migration[7.1]
  def change
    change_column :bugs, :user_id, :bigint, null: true
  end
end
