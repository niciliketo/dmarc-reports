# frozen_string_literal: true

# Render tables in a view
# columns is an array of symbols specifying the columns to include
# data is an array of active record objects to render
class TableComponent < ViewComponent::Base
  def initialize(columns:, data:)
    @columns = columns
    @data = data
    # We want the object so we can get translations
    @object = data.first.class
  end

  # Format the data according to specific rules
  def f(value)
    case value
    when ActiveSupport::TimeWithZone
      value.to_date&.to_fs(:long) || '-'
    else
      value
    end
  end
end
