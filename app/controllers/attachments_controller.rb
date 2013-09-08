class AttachmentsController < ApplicationController

  def new
    @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.create(params[:attachment])
  
    #here's where we call Resque!
    Resque.enqueue(PagecountWorker, @attachment.id)
  end

  def show
    a = Attachment.find(params[:id])

    #now, we perform nearly the same operation
    #but, synchronously, notice the call is 
    #completely different.
    a.save_page_count

    @page_count = a.page_count
  end
end
