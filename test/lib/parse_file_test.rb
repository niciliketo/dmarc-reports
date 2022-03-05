# frozen_string_literal: true

require 'test_helper'

class ParseFileTest < ActiveSupport::TestCase
  test 'It parses a .zip file' do
    f = File.open('test/fixtures/files/report1.zip')
    res = ParseFile.new(f)
    assert_includes res.content, 'org_name'
  end
  test 'It parses a .gz file' do
    f = File.open('test/fixtures/files/report2.xml.gz')
    res = ParseFile.new(f)
    assert_includes res.content, 'org_name'
  end

  test 'It parses a .xml file' do
    f = File.open('test/fixtures/files/report1.xml')
    res = ParseFile.new(f)
    assert_includes res.content, 'org_name'
  end
end
