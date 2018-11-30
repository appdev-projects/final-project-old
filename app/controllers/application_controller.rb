class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, raise: false
  
  def merge_sounds(a,b,c)
    system "mp3wrap #{c} #{a} #{b}"
  end
  
  
end
