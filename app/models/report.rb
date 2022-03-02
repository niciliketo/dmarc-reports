class Report < ApplicationRecord
  has_many :records, dependent: :destroy
end
