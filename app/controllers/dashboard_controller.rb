class DashboardController < ApplicationController

  def index
    @cities = Job.city_count
  end

end
