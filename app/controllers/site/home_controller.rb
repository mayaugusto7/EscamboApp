class Site::HomeController < SiteController

  def index

    HardWorker.perform_async("Maycon Ribeiro")

    puts ">>>>>>>>>>>>>>>>> #{session[:name]}"

    @categories = Category.order_by_description
    @ads = Ad.descending_order(params[:page])
    @carousel = Ad.carousel_random()

  end
end
