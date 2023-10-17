class Public::SearchesController < ApplicationController
  before_action :authenticate_member!

  def index
    @posts = Post.where(open_status: [0, 2])
                  .joins(:member) #これが必要
                  .where(members: { company_password: current_member.company_password })
                  .search(params[:keyword])
                  .page(params[:page])
                  .per(6)
  end

end
