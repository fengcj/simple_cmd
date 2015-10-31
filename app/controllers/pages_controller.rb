class PagesController < ApplicationController

  # layout false
  layout "admin"


  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    # Instantiate a new object using form parameters
    @page = Page.new(page_params)
    # Save the object
    if @page.save
    # If save successed, redirect to the index action
      flash[:notice] = "Page create successfully"
      redirect_to(:action => "index")
    # If save fails, redisplay the form so user can fix problems
    else
      render("new")
    end
  end

  def edit
    @page = Page.find(params[:id])
  end


  def update
    # Find an object using form DB
    @page = Page.find(params[:id])
    # Update the object
    if @page.update_attributes(page_params)
    # If update successed, redirect to the show action
      flash[:notice] = "Page update successfully"
      redirect_to(:action => "show", :id => @page.id)
    # If update fails, redisplay the form so user can fix problems 
    else
      render("edit")  
    end
  end  

  def delete
    @page = Page.find(params[:id])
  end

  def destory
    page = Page.find(params[:id])
    page.destroy 
    flash[:notice] = "Page '#{page.name}'delete successfully"
    redirect_to(:action => "index")
  end


  private 
    def page_params
      # same as using "params[:page]", except that it:
      # raises an error if :subject is not present
      # allows listed attributes to be mass-assigned
      params.require(:page).permit(:subject_id,:name,:permalink,:position,:visible)
    end

end

