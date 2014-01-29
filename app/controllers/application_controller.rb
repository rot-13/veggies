class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  def self.admin_only(options = {})
    http_basic_authenticate_with({:name => "admin", :password => "1234"}.merge(options))
  end

end
