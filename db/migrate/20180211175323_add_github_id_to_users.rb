class AddGithubIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :github_id, :integer
  end
end
