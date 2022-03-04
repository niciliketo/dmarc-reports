# frozen_string_literal: true

require 'test_helper'

class ParseDmarcTest < ActiveSupport::TestCase
  test 'It parses' do
    xml = File.read('test/fixtures/files/report1.xml')
    res = ParseDmarc.new(xml)
    assert_equal 'google.com', res.metadata[:org_name]
  end
end
