class StaticPagesController < ApplicationController
  def index
  	@products = Product.limit(3)
  end
end


class StaticPageController < ApplicationController
   def landing_page
    @products = Product.first 
   end
end


class StaticPageController < ApplicationController
   def landing_page
    @products = Product.limit(3)
   end
end