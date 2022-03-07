# frozen_string_literal: true

class CardComponentPreview < ViewComponent::Preview
  def standard_card
    render(MetricComponent.new(title: 'Widget!', icon: 'fa-calendar', value: '999'))
  end

  def narrow_card
    render(MetricComponent.new(title: 'Widget!', icon: 'fa-calendar', value: '999', width: :narrow))
  end

  def full_card
    render(MetricComponent.new(title: 'Widget!', icon: 'fa-calendar', value: '999', width: :full))
  end
end
