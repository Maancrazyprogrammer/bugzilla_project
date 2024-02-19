class Addtypetobug < ActiveRecord::Migration[7.1]
  def change
    add_column :bugs, :type, :integer, default:0
  end
end
