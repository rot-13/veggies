class VeggiesController < ApplicationController

  admin_only

  def update
    redirect_to :back
  end

end
