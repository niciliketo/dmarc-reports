class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.references :report, null: false, foreign_key: true
      t.string :source_ip
      t.string :dkim
      t.string :spf
      t.string :type
      t.string :comment
      t.string :header_from
      t.string :dkim_domain
      t.string :dkim_result
      t.string :dkim_hresult
      t.string :spf_domain
      t.string :spf_result
      t.integer :count
      t.string :disposition
      t.string :reason_type
      t.string :reason_comment

      t.timestamps
    end
  end
end
