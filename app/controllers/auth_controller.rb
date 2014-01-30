class AuthController < ApplicationController

  before_filter :admin_only

  def callback
    access_token = request.env['omniauth.auth'][:credentials][:token]
    access_secret = request.env['omniauth.auth'][:credentials][:secret]
    options = {
      access_token: access_token,
      access_secret: access_secret
    }

    #rendering the credentials to the client so an admin could later on add the credentials to the twitter user model
    render :text => options
  end
end
