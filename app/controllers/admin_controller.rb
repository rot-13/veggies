class AdminController < ApplicationController

  before_filter :admin_only

  def dashboard
    @veggies = Veggie.by_weights.to_a
  end

end
