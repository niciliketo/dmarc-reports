# frozen_string_literal: true

# Card component
class CardComponent < ViewComponent::Base
  def initialize(title:)
    @title = title
  end

end
