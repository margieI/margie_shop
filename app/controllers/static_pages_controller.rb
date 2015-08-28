class StaticPagesController < ApplicationController
  def index
  end
end


class StaticPageController < ApplicationController
   def landing_page
    @products = Product.limit(3)
   end
end