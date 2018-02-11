class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :github_token
      t.string :slack_token

      t.timestamps
    end
  end
end
