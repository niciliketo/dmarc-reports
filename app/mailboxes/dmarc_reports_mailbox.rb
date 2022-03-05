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
      # TODO: DRY
      xml = ParseAttachment.new(attachment).content
      dmarc = ParseDmarc.new(xml)
      pp = PolicyPublished.find_or_create_by(dmarc.policy_published)
      report = Report.create(dmarc.metadata.merge(policy_published: pp))

      dmarc.records.each do |row|
        report.records << Record.create(row)
      end
    end
  end
end
