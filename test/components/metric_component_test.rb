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

  def test_component_renders_width_narrow
    render_inline(MetricComponent.new(title: 'Widget!', icon: 'fa-calendar', value: '999', width: :narrow))
    assert_selector('div', class: %r{xl:w-1/4})
  end

  def test_component_renders_width_full
    render_inline(MetricComponent.new(title: 'Widget!', icon: 'fa-calendar', value: '999', width: :full))
    assert_selector('div', class: /full/)
  end
end
