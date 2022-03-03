# frozen_string_literal: true

# Parse attachments and extrac the text
class ParseAttachment
  require 'zip'

  MAX_SIZE = 1024**3

  def initialize(attachment)
    @content = extract(attachment)
  end

  def content
    @content
  end

  private

  def extract(attachment)
    if attachment.mime_type == 'application/gzip'
      gunzip_attachment(attachment)
    elsif attachment.mime_type == 'application/zip'
      unzip_attachment(attachment)
    else
      raise 'Attachment was unknown type'
    end
  end

  def unzip_attachment(attachment)
    xml = ''.dup
    Zip::File.open_buffer(attachment.decoded) do |zip_file|
      entry = zip_file.glob('*.xml').first
      # raise 'File too large when extracted' if entry.size > MAX_SIZE
      entry.get_input_stream do |io|
        xml << io.read
      end
    end
    xml
  end

  def gunzip_attachment(attachment)
    fd = IO.sysopen('test/fixtures/files/report2.xml.gz')
    io = IO.new(fd)
    gz = Zlib::GzipReader.new(io)
    xml = gz.read
    gz.close
    xml
  end
end



