class ExportWorker
  @queue = :exports_queue

  def self.perform(message_id)
    @message = Message.find(message_id) if message_id.present?
    if @message.present?    	   
	    	@message.update_attributes(message: 'Successful export')
	  else
      @message.update_attributes(message:  'Export failed')
    end
  end
end