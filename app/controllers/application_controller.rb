class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  def admin_only(options = {})
    self.class.http_basic_authenticate_with({:name => ENV['ADMIN_USER'], :password => ENV['ADMIN_PASS']}.merge(options))
  end

end
