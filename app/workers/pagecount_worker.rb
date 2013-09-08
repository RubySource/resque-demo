class PagecountWorker
  @queue = :pagecount_queue
  
  def self.perform(attachment_id)
    attachment = Attachment.find(attachment_id)

    #notice how we're just reusing the model method!
    attachment.save_page_count

    puts "added attachment"
  end
end
