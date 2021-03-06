class ServiceMenusController < InheritedResources::Base
  before_filter :authenticate_user!
  def index
    @service_menus = @current_company.service_menus
  end

  def show
  	@service_menu = ServiceMenu.find(params[:id])
  	@technicians = ServiceMenu.find(params[:id]).technicians.paginate(page: params[:page], per_page: 30)
  end

end
