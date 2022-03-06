# frozen_string_literal: true

require 'test_helper'

class TableComponentTest < ViewComponent::TestCase
  def test_component_renders_table_with_correct_title
    render_inline(TableComponent.new(columns: PolicyPublished.columns.collect(&:name), data: PolicyPublished.all))
    assert_selector('th:nth-child(1)', text: 'ID')
  end

  def test_component_renders_table_with_correct_data
    data = PolicyPublished.all
    render_inline(TableComponent.new(columns: PolicyPublished.columns.collect(&:name), data: data))
    assert_selector('tbody>tr:nth-child(1)>td:nth-child(1)', text: data[0].id)
  end

  def test_component_renders_datetime_columns
    subject = TableComponent.new(columns: [], data: [])

    assert_equal(subject.f(Time.zone.now), DateTime.now.to_date.to_fs(:long))
  end

  def test_component_renders_string_columns
    subject = TableComponent.new(columns: [], data: [])
    text = 'Wibble'
    assert_equal(subject.f(text), text)
  end
end
