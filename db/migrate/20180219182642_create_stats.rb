class CreateStats < ActiveRecord::Migration[5.1]
  def change
    create_table :stats do |t|
      t.string :title
      t.string :url
      t.datetime :created
      t.datetime :closed
      t.integer :hours
      t.integer :changes
      t.integer :comments
      t.references :org, foreign_key: true
    end
  end
end
