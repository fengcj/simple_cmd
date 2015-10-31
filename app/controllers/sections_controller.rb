class SectionsController < ApplicationController

  # layout false
  layout "admin"


  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    # Instantiate a new object using form parameters
    @section = Section.new(section_params)
    # Save the object
    if @section.save
    # If save successed, redirect to the index action
      flash[:notice] = "Section create successfully"
      redirect_to(:action => "index")
    # If save fails, redisplay the form so user can fix problems
    else
      render("new")
    end
  end

  def edit
    @section = Section.find(params[:id])
  end


  def update
    # Find an object using form DB
    @section = Section.find(params[:id])
    # Update the object
    if @section.update_attributes(section_params)
    # If update successed, redirect to the show action
      flash[:notice] = "Section update successfully"
      redirect_to(:action => "show", :id => @subject.id)
    # If update fails, redisplay the form so user can fix problems 
    else
      render("edit")  
    end
  end  

  def delete
    @section = Section.find(params[:id])
  end

  def destory
    section = Section.find(params[:id])
    section.destroy 
    flash[:notice] = "Section '#{section.name}'delete successfully"
    redirect_to(:action => "index")
  end


  private 
    def section_params
      # same as using "params[:subject]", except that it:
      # raises an error if :subject is not present
      # allows listed attributes to be mass-assigned
      params.require(:section).permit(:page_id,:name,:position,:visible,:content_type,:content)
    end

end

