class HomeController < ApplicationController
  def index
  	@name = nil
  	@names = Name.paginate(:page => params[:page], :per_page => 15, :order => "created_at DESC")
  	@topten = Name.all(:order => "votes DESC", :limit => 10)
  end

end
