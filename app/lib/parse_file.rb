# frozen_string_literal: true

# Parse files and extrac the text
class ParseFile
  require 'zip'
  attr_reader :content

  MAX_SIZE = 1024**3

  def initialize(file)
    @content = extract(file)
  end

  private

  def extract(file)
    raise 'Target is not a file' unless file.is_a? File

    extract_file(file)
  end

  def extract_file(file)
    case File.extname(file)
    when '.gz'
      gunzip_file(file)
    when '.zip'
      unzip_file(file)
    when '.xml'
      read_file(file)
    else
      raise "Target is a file of unknown format #{File.extname(file)}"
    end
  end

  def gunzip_file(file)
    gz = Zlib::GzipReader.new(file)
    xml = gz.read
    gz.close
    xml
  end

  def unzip_file(file)
    xml = ''.dup
    Zip::File.open(file) do |zip_file|
      entry = zip_file.glob('*.xml').first
      # raise 'File too large when extracted' if entry.size > MAX_SIZE
      entry.get_input_stream do |io|
        xml << io.read
      end
    end
    xml
  end

  def read_file(file)
    file.read
  end
end



