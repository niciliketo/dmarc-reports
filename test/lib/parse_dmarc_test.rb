require 'test_helper'

class ParseDmarcTest < ActiveSupport::TestCase
  test "It parses" do
    res = ParseDmarc.new('test/fixtures/files/report1.zip')
    assert_equal 'google.com', res.metadata[:org_name]
  end
end
