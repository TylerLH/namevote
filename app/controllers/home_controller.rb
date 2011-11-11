class HomeController < ApplicationController
  def index
  	@name = nil
  	@names = Name.paginate(:page => params[:page], :per_page => 15, :order => "created_at DESC")
  end

end
