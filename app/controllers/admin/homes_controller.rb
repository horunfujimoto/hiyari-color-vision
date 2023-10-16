class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def admin_top
  end

end
