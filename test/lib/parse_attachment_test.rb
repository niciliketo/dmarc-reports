# frozen_string_literal: true

require 'test_helper'

class ParseAttachmentTest < ActiveSupport::TestCase
  test 'It parses a .zip attachment' do
    m = Mail.new
    m.attachments['report1.zip'] = File.read('test/fixtures/files/report1.zip')
    res = ParseAttachment.new(m.attachments.first)
    assert_includes res.content, 'org_name'
  end
  test 'It parses a .gz attachment stream' do
    m = Mail.new
    m.attachments['report2.xml.gz'] = File.read('test/fixtures/files/report2.xml.gz')
    res = ParseAttachment.new(m.attachments.first)
    assert_includes res.content, 'org_name'
  end
end
