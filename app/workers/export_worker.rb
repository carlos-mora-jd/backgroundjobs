class ExportWorker
  @queue = :exports_queue

  def self.perform(mensaje_id)
    @mensaje = Mensaje.find(mensaje_id) if mensaje_id.present?
    if @mensaje.present?    	   
	    	@mensaje.update_attributes(mensaje: 'Successful export')
	  else
      @mensaje.update_attributes(mensaje:  'Export failed')
    end
  end
end