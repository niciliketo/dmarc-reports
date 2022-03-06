require 'test_helper'

class MetricComponentTest < ViewComponent::TestCase
  def test_component_renders_title
    render_inline(CardComponent.new(title: 'Widget!')) { 'Hello World!' }
    assert_selector("h2[class='font-bold uppercase text-gray-600']", text: 'Widget!')
  end
end
