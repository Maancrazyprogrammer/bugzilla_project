class RemovetypefromBug < ActiveRecord::Migration[7.1]
  def change
    remove_column :bugs, :type, :integer, default:0
    #Ex:- :default =>''
  end
end
