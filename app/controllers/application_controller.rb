class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, raise: false
  
  def merge_sounds(a,b,c,d)
    system "mp3wrap #{d} #{a} #{b} #{c}"
  end
  
  helper_method :merge_sounds
  
  
end
