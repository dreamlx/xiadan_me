class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => :index
  before_filter :check_technicians_state
  def index

  end

  def venues
    @venues = @current_company.venues
  end

  def services
    @service_menus = @current_company.service_menus
  end

  def technicians
    @technicians = @current_company.technicians.paginate(page: params[:page], per_page: 30)
  end

end
