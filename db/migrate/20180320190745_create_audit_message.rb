class CreateAuditMessage < ActiveRecord::Migration[5.1]
  def change
    create_table :audit_messages do |t|
      t.string :channel
      t.string :message
      t.references :org, foreign_key: true
    end
  end
end
