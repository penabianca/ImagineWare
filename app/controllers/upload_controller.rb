class UploadController < ApplicationController
  def index
     render :file => 'app\views\courses\show.html.haml'
  end
  def uploadFile
    post = DataFile.save(params[:upload])
    render :text => "File has been uploaded successfully"
  end
endclass UploadController < ApplicationController
end
