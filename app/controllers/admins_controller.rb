class AdminsController < ApplicationController
  def index
    @users = User.all.paginate(page: params[:page], :per_page => 20)
  end

end
