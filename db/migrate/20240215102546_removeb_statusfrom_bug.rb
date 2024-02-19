class RemovebStatusfromBug < ActiveRecord::Migration[7.1]
  def change
    remove_column :bugs, :b_status, :string
  end
end
