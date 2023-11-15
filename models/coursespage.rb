require "logger"
require "sequel"
class Course < Sequel::Model(:courses)
  
  def set_picture_url (biology)
    self.picture_url = Imageuploader.getFileName(params[:biology])
  end
  def set_picture_url(computerscience)
    self.picture_url = Imageuploader.getFileName(params[:computerscience])
end
def set_picture_url(maths)
  self.picture_url = Imageuploader.getFileName(params[:maths])
end
end