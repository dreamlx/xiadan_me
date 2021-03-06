# coding: utf-8
module Api
  class MenuOrdersController < Api::BaseController
    skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
    def index
      @menu_orders = MenuOrder.all
    end

    def show
      @menu_order = MenuOrder.find(params[:id])
    end
    
    def create
      @menu_order = MenuOrder.new(params[:menu_order])
      @menu_item_ids = []
      @menu_item_ids = params[:menu_item_ids].split(",") if params[:menu_item_ids]
      if @menu_order.save
        @menu_item_ids.each do |item_id|
          @menu_order.menu_order_menu_itemships.create(menu_item_id: item_id)
        end
        render json: @menu_order, status: :created, success: true, message: '下单成功'
      else
        render json: @menu_order, status: :failed, success: false, message: '无法下单，请联系管理员'
      end
    end
  end
end