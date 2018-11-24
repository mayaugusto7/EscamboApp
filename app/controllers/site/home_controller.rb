class Site::HomeController < SiteController

  def index

    cookies[:user_name] = "david"
    cookies[:lat_lon] = JSON.generate([47.68, -122.37])
    cookies[:login] = { value: "XJ-122", expires: 1.hour.from_now }
    cookies.signed[:user_id] = "Member Maycon"
    cookies.encrypted[:discount] = "EscamboApp"

    @categories = Category.order_by_description
    @ads = Ad.descending_order(params[:page])
    @carousel = Ad.carousel_random()

    puts ">>>>>>>>> #{cookies[:user_name]}"
    puts ">>>>>>>>> #{cookies[:lat_lon]}"
    puts ">>>>>>>>> #{eval(cookies[:lat_lon]).class}"
  end
end
