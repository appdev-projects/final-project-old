class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, raise: false
  
  def merge_sounds(output_file)
    system "mp3wrap output_file part1.mp3 part2.mp3"
  end
  
  
end
