# coding: utf-8
ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        h1 '欢迎访问下单服务平台'
        ol do
          if current_admin_user.company.blank?
            li link_to '设置企业信息', new_admin_company_path
          else
            li link_to '设置企业信息', admin_companies_path
          end
          li link_to '设置菜品分类', new_admin_category_path
          li link_to '设置菜品条目', new_admin_menu_item_path
          li '完成，前台查看一下吧'
        end
        
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
