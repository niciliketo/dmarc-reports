require 'test_helper'

class CardComponentTest < ViewComponent::TestCase
  def test_component_renders_title
    render_inline(CardComponent.new(title: 'Widget!')) { 'Hello World!' }
    assert_selector("h2[class='font-bold uppercase text-gray-600']", text: 'Widget!')
  end

  def test_component_renders_width_narrow
    render_inline(CardComponent.new(title: 'Widget!', width: :narrow))
    assert_selector('div', class: %r{xl:w-1/4})
  end

  def test_component_renders_width_full
    render_inline(CardComponent.new(title: 'Widget!', width: :full))
    assert_selector('div', class: /xl:w-full/)
  end
end
