class StaticPagesController < ApplicationController


  def index
  	@products = Product.limit(all)
  end


  def landing_page
  	@featured_product = Product.first
    @products = Product.limit(8)
  end

  



  def thank_you
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]
 ActionMailer::Base.mail(:from => @email, 
        :to => 'itaimargi@hotmail.com', 
        :subject => "A new contact form message from #{@name}", 
        :body => @message).deliver
end
end
