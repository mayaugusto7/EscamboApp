class Site::SearchController < SiteController

  def ads
    @ads = Ad.search([:q], fields: [:title], page: params[:page], per_page: Ad::QTD_PER_PAGE)
    @categories = Category.order_by_description
  end
end
