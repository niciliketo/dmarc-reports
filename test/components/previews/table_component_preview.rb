# frozen_string_literal: true

class TableComponentPreview < ViewComponent::Preview
  def with_all_policy_publisheds
    render(TableComponent.new(columns: PolicyPublished.columns.collect(&:name), data: PolicyPublished.all))
  end
end
