class CreateContributors < ActiveRecord::Migration[5.1]
  def change
    create_table :contributors do |t|
      t.string :github_name
      t.string :slack_name
      t.references :org, foreign_key: true
    end
  end
end
