class VeggiesController < ApplicationController

  before_filter :admin_only, :only => [:update]

  def index
    @veggies = Veggie.order(:heb_name => :asc).select(:heb_name, :id).to_a
  end
  
  def show
    @veggie = Veggie.includes(:prices).find(params[:id])
    prices = @veggie.prices

    @dates = prices.map(&:created_at).map { |date| date.strftime("%d/%m/%y") }.to_json
    @values = prices.map(&:primary_price).map { |value| value / 100 }.to_json
    @high_values = prices.map(&:secondary_price).map { |value| value / 100 }.to_json

  end

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
