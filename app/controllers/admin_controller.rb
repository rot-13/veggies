class AdminController < ApplicationController

  admin_only

  def dashboard
    @veggies = Veggie.all.to_a
  end

end
