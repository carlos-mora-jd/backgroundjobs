class ImportWorker
  require 'logger'
  @queue = :logs_queue
  $LOG = Logger.new "log/user.log"

  def self.perform(file_name,unsuccess, success)
  	date = DateTime.now.strftime("%Y-%m-%d %I:%M:%S")
  	if file_name.empty?
        file_name = "empty"
  	else
  		filename = "#{file_name}"
  	end 

	$LOG.debug("---------------------------------------")
	$LOG.debug("File: #{filename}")
	$LOG.debug("Imported lines --- #{success}")
	$LOG.debug("Failed lines --- #{unsuccess}")
	$LOG.debug("Total lines --- #{unsuccess + success}")
	$LOG.debug("Finished at #{date}")
  end
end	