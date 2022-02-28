class DmarcReportsMailbox < ApplicationMailbox
  def process
    binding.break
    puts 'its on'
  end
end
