class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  def self.admin_only(options = {})
    http_basic_authenticate_with({:name => "admin", :password => "1234"}.merge(options))
  end

  def callback
    access_token = request.env['omniauth.auth'][:credentials][:token]
    access_secret = request.env['omniauth.auth'][:credentials][:secret]
    options = {
      access_token: access_token,
      access_secret: access_secret
    }

    #rendering the credentials to the client so an admin could later on add the credentials to the twitter user model
    render text: options
  end
end
