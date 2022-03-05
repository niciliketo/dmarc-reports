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
    Rails.logger.info "Processing attachments"
    mail.attachments.each do |attachment|
      Rails.logger.info "Attachment: #{attachment.filename} "
      # TODO: DRY
      xml = ParseAttachment.new(attachment).content
      Rails.logger.info "XML: #{xml}"
      dmarc = ParseDmarc.new(xml)
      pp = PolicyPublished.find_or_create_by(dmarc.policy_published)
      Rails.logger.info "Policy: #{pp.id}"
      report = Report.create(dmarc.metadata.merge(policy_published: pp))
      Rails.logger.info "Report: #{report.id}"
      dmarc.records.each do |row|
        report.records << Record.create(row)
      end
      Rails.logger.info "Records: #{dmarc.records.length}"
    end
  end
end
