require 'open-uri'

class Attachment < ActiveRecord::Base
  attr_accessible :file_url, :page_count

  def check_file_url
   #... 
  end

  def calculate_cost
    #...
  end

  #this is the method to be called synchronously.
  def save_page_count
    io = open(file_url)
    reader = PDF::Reader.new(io)
    update_attributes(:page_count => reader.page_count)
  end

  def email_attachment_to_admin
    #...
  end
end
