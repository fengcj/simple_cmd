class SubjectsController < ApplicationController


  # layout false
  layout "admin"
  
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    # Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
    # If save successed, redirect to the index action
      flash[:notice] = "Subject create successfully"
      redirect_to(:action => "index")
    # If save fails, redisplay the form so user can fix problems
    else
      render("new")
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end


  def update
    # Find an object using form DB
    @subject = Subject.find(params[:id])
    # Update the object
    if @subject.update_attributes(subject_params)
    # If update successed, redirect to the show action
      flash[:notice] = "Subject update successfully"
      redirect_to(:action => "show", :id => @subject.id)
    # If update fails, redisplay the form so user can fix problems 
    else
      render("edit")  
    end
  end  

  def delete
    @subject = Subject.find(params[:id])
  end

  def destory
    subject = Subject.find(params[:id])
    subject.destroy 
    flash[:notice] = "Subject '#{subject.name}'delete successfully"
    redirect_to(:action => "index")
  end


  private 
    def subject_params
      # same as using "params[:subject]", except that it:
      # raises an error if :subject is not present
      # allows listed attributes to be mass-assigned
      params.require(:subject).permit(:name,:position,:visible)
    end

end
