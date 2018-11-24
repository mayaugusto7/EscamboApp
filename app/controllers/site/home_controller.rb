class Site::HomeController < SiteController

  def index

    puts ">>>>>>>>>>>>>>>>> #{session[:name]}"

    @categories = Category.order_by_description
    @ads = Ad.descending_order(params[:page])
    @carousel = Ad.carousel_random()

  end
end
