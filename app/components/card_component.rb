# frozen_string_literal: true

# Card component
class CardComponent < ViewComponent::Base
  def initialize(title:, width: :regular)
    @title = title
    @width = width
  end

  def width
    case @width
    when :narrow
      'w-full md:w-1/2 xl:w-1/4 p-6'
    when :full
      'w-full md:w-full xl:w-full p-6'
    else
      'w-full md:w-1/2 xl:w-1/3 p-6'
    end
  end
end
