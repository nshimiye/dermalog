class DataFile < ActiveRecord::Base
  def self.save(upload, doctor, caseLog)
		
	  if(not upload[:datafile].headers.to_s.downcase.include? "content-type: image")
         return nil
      end

    	name =  upload['datafile'].original_filename
		exts = name.split(".")
		ext = exts[exts.length-1]
    	filename = uniqueGenerator + "-." + ext

	 	user_dir = File.join('public','data', doctor.id.to_s)
	 	if (not File.directory?(user_dir))
    		Dir.mkdir(user_dir, 0700)

	 	end
	 	data_dir = File.join(user_dir, caseLog.id.to_s)
	 	if (not File.directory?(data_dir))
    		Dir.mkdir(data_dir, 0700)

	 	end
    # create the file path
    path = File.join(data_dir, filename)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }

    return File.join('/data', doctor.id.to_s, caseLog.id.to_s, filename)
  end

  def self.clean(image)
	filepath = Rails.root.join('public', image[:url].sub("/data/", "data/"))
	if File.exist?(filepath)
		File.delete(filepath)
	end
  end

  private
  	def self.uniqueGenerator
  		return (0...35).map { ('a'..'z').to_a[rand(26)] }.join
  	end

  	    # clean up the path sent from the browser
    def self.sanitize_filename(file_name)
      # get only the filename, not the whole path (from IE)
      just_filename = File.basename(file_name) 
      # replace all none alphanumeric, underscore
      # with underscore
      return just_filename.gsub(/[^\p{Alnum}|\p{Space}|-]/, '_')
    end
end