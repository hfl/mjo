class Admin::DashboardController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  def index
    @page_title = '起始页'
  end

  def about
    #code
  end

  def help
    #code
  end
end
