class AddSimuliationModeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :simulation_mode, :boolean
  end
end
