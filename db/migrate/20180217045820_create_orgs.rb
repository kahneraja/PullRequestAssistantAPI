class CreateOrgs < ActiveRecord::Migration[5.1]
  def change
    create_table :orgs do |t|
      t.string :login
      t.string :description
      t.string :url
      t.references :user, foreign_key: true
    end
  end
end
