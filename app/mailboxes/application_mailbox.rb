class ApplicationMailbox < ActionMailbox::Base
  routing /dmarc/i     => :dmarc_reports
end
