class MainApplication
  attr_accessor :user_email, :user_password, :file_path
  
  def initialize(user_email, user_password, file_path)
    @user_email = user_email
    @user_password = user_password
    @file_path = file_path
  end
  
  def configure
  end
end