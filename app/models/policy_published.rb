class PolicyPublished < ApplicationRecord
  has_many :reports, dependent: :destroy
end
