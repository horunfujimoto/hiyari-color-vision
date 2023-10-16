class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def admin_top
    @members_count = Member.count
    @posts_count =  Post.count
    @companies_count = Member.distinct.count(:company_password)
  end

end
