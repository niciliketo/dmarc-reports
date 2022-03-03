class DmarcReportsMailbox < ApplicationMailbox
  def process
    if mail.attachments
      create_records_from_attachment(mail)
    else
      Rails.logger.info "No attachments found in email: #{mail.subject}"
    end
  end

  private

  def create_records_from_attachment(mail)
    mail.attachments.each do |attachment|
      xml = ParseAttachment.new(attachment).content
      dmarc = ParseDmarc.new(xml)
      report = Report.create(dmarc.metadata)
      # report.create_policy_published(dmarc.policy_published)
      dmarc.records.each do |row|
        report.records << Record.create(row)
      end
    end
  end
end
