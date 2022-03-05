# frozen_string_literal: true

require 'test_helper'

class ParseDirectoryTest < ActiveSupport::TestCase
  test 'It parses' do
    assert_difference('PolicyPublished.count', 2) do
      ParseDirectory.new(Rails.root.join('test/fixtures/files')).process
    end
  end
end
