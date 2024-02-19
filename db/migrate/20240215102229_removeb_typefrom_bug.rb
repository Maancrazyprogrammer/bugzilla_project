class RemovebTypefromBug < ActiveRecord::Migration[7.1]
  def change
    remove_column :bugs, :b_type, :string
  end
end
