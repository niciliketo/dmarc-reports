# frozen_string_literal: true

# Parse attachments and extrac the text
class ParseDirectory
  def initialize(dir)
    Dir.chdir(dir)
  end

  def file_names
    Dir.glob('{*.xml,*.gz,*.zip}')
end

  def process
    file_names.each do |file_name|
      file = File.open(file_name, 'r')
      #TODO: DRY
      xml = ParseFile.new(file).content
      dmarc = ParseDmarc.new(xml)
      pp = PolicyPublished.find_or_create_by(dmarc.policy_published)
      report = Report.create(dmarc.metadata.merge(policy_published: pp))

      dmarc.records.each do |row|
        report.records << Record.create(row)
      end

    end
  end

  private

  def file_to_attachment(file)
    m = Mail.new
    debugger
    m.attachments[file] = file
    res = ParseAttachment.new(m.attachments.first)
    assert_includes res.content, 'org_name'
  end
end



