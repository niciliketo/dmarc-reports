class AddPolicyIdToReport < ActiveRecord::Migration[7.0]
  def change
    add_reference :reports, :policy_published, null: false, foreign_key: true
  end
end
