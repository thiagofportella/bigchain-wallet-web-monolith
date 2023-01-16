class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @credentials = current_user.credentials
  end
end
