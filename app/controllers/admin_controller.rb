class AdminController < ApplicationController

  admin_only

  def dashboard
    @veggies = Veggie.by_weights.to_a
  end

end
