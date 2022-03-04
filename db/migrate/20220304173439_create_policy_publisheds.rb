class CreatePolicyPublisheds < ActiveRecord::Migration[7.0]
  def change
    create_table :policy_publisheds do |t|
      t.string :domain
      t.string :adkim
      t.string :aspf
      t.string :p
      t.string :pct

      t.timestamps
    end
  end
end
