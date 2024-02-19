class AddbTypetobug < ActiveRecord::Migration[7.1]
  def change
    add_column :bugs, :b_type, :integer
  end
end
