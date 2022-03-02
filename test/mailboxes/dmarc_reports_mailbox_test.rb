require 'test_helper'


class DmarcReportsMailboxTest < ActionMailbox::TestCase
  test 'receive mail' do
    assert_difference 'Report.count', 0 , 'a report should not be created' do
      receive_inbound_email_from_mail \
        to: '"DMARC Reports" <dmarc@dmarc-reports.testmd.co.uk>',
        from: '"else" <else@example.com>',
        subject: 'Report attached!',
        body: 'Hello?'
    end
  end

  test 'receive mail with attachment' do
    assert_difference 'Report.count', 1 , 'a report should be created' do
      receive_inbound_email_from_mail do |mail|
        mail.to '"DMARC Reports" <dmarc@dmarc-reports.testmd.co.uk>'
        mail.from '"else" <else@example.com>'
        mail.subject 'Report attached!'

        mail.text_part do |part|
          part.body 'Some text'
        end

        mail.html_part do |part|
          part.body '<h1>More text</h1>'
        end

        mail.add_file File.join(Rails.root, 'test/fixtures/files/report1.zip')
      end
    end
  end
end

