# frozen_string_literal: true

class MetricComponent < ViewComponent::Base
  def initialize(title:, icon:, value:)
    @title = title
    @icon = icon
    @value = value
  end
end
