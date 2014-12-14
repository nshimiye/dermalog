class DataFile < ActiveRecord::Base
  def self.save(upload, doctor, caseLog)


  		print "\n ==== headers ====\n"
		print upload["datafile"].headers
  		print "\n ==== end of headers ====\n"
		
    	name =  upload['datafile'].original_filename
		
    	filename = uniqueGenerator + "-" + name

	 	filepath = Rails.root.join('public', 'data', doctor.id.to_s, caseLog.id.to_s, name)
	 	print filepath

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

  private
  	def self.uniqueGenerator
  		return (0...25).map { ('a'..'z').to_a[rand(26)] }.join
  	end
end