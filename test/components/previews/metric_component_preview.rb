# frozen_string_literal: true

class MetricComponentPreview < ViewComponent::Preview
  def standard_metric
    render(MetricComponent.new(title: 'Widget!', icon: 'fa-calendar', value: '999'))
  end

  def width_narrow
    render(MetricComponent.new(title: 'Widget!', icon: 'fa-calendar', value: '999', width: :narrow))
  end

  def width_full
    render(MetricComponent.new(title: 'Widget!', icon: 'fa-calendar', value: '999', width: :full))
  end
end
