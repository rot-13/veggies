class VeggiesController < ApplicationController

  before_filter :admin_only

  def update
    current_veggie.update!(veggie_params)
    respond_to do |format|
      format.json { render :json => current_veggie }
      format.html { redirect_to :back }
    end
  end

  private

  def current_veggie
    @veggie ||= Veggie.find(params[:id] || params[:veggie_id])
  end

  def veggie_params
    params.require(:veggie).permit(:eng_name, :color, :weight, :icon)
  end

end
