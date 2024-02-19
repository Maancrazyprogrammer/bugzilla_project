class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :p_Name
      t.string :p_desc

      t.timestamps
    end
  end
end
