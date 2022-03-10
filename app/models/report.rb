class Report < ApplicationRecord
  has_many :records, dependent: :destroy
  belongs_to :policy_published

  def total_records
    record_summary.values.sum
  end

  def spf_fail_records
    record_summary[%w[fail pass]].to_i + record_summary[%w[fail fail]].to_i
  end

  def dkim_fail_records
    record_summary[%w[pass fail]].to_i + record_summary[%w[fail fail]].to_i
  end

  def record_total
    record_summary.values.sum
  end

  private

  # Get a summary of the records
  # grouped by :spf and dkim
  # we will use this to return summary metrics
  def record_summary
    records.group(:spf, :dkim).count
  end
end
