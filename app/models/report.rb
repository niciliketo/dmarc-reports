class Report < ApplicationRecord
  has_many :records, dependent: :destroy
  belongs_to :policy_published
end
