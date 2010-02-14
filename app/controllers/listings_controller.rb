class ListingsController < ApplicationController
  before_filter :authorize_tenant
  def index
    @units = Unit.find_all_by_listed(1)
  end

  def show
    @unit = Unit.find(params[:id])
  end

end

