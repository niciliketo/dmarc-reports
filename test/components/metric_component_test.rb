require 'test_helper'

class MetricComponentTest < ViewComponent::TestCase
  def test_component_renders_title
    render_inline(MetricComponent.new(title: 'Widget!', icon: 'fa-calendar', value: '999'))
    assert_selector("h2[class='font-bold uppercase text-gray-600']", text: 'Widget!')
  end

  def test_component_renders_icon
    render_inline(MetricComponent.new(title: 'Widget!', icon: 'fa-calendar', value: '999'))
    assert_selector('i', class: /fa\-calendar/)
  end

  def test_component_renders_value
    render_inline(MetricComponent.new(title: 'Widget!', icon: 'fa-calendar', value: '999'))
    assert_selector('p', text: '999')
  end
end
