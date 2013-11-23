class DataFile < ActiveRecord::Base
  # attr_accessible :title, :body
  def self.save(upload)
    name =  upload['datafile'].original_filename
    directory = "upload/public/data"
    #directory = Rails.root.join("upload","public","data");
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end
end
