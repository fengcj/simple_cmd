class DemoController < ApplicationController
  
  # layout is a method
  # layout false
    layout "admin"
  
  def index

  end

  def hello
  	#render(:template => 'demo/hello')
  	#render('demo/hello')
  	#render('hello')
  	@array = [1,2,3,4,5]  # must be defined in action, then the relatived view can access
  	@id = params["id"].to_i
  	@page = params[:page].to_i
  end

  def other_hello
  	redirect_to(:controller => 'demo', :action => 'index')
  end

  def google
  	redirect_to("http://google.com")
  end

  def text_helpers
  end

  def escape_output
  end

end
