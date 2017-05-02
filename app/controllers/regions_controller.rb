class RegionsController < ApplicationController
  before_action :validate_params, :set_variables, :find_region, only: [:inflate_price]

  def inflate_price
    historical_indexes = @region.historical_sales.where(date: @from..@to).order(:date).map(&:index_value)
    if historical_indexes.empty?
      render json: { error: "Unable to fetch historical sale indexes for given dates" }, status: :not_found
    else
      inflated_price = compute_inflated_price(@price, historical_indexes)
      render json: { inflated_price: inflated_price }
    end
  end

  private
  def params_present?
    [:name, :price, :from, :to].all? { |p| params[p].present? }
  end

  def validate_params
    render json: { error: "Missing request param" }, status: :bad_request unless params_present?
  end

  def set_variables
    @name, @price, @from, @to = params[:name], params[:price], params[:from], params[:to]
  end

  def find_region
    render json: { error: "Region not found" }, status: :not_found unless @region = Region.find_by(name: @name)
  end

  def compute_inflated_price(price, historical_indexes)
    (price.to_f * (historical_indexes.last / historical_indexes.first)).round
  end

end
