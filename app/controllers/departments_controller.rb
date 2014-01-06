class DepartmentsController < ApplicationController
   def index
    @departments=Department.all
  end

  def create
    # render text: params[:department].inspect
    @department=Department.new(permission_access)
    if @department.save
      redirect_to @department
    else
      render 'new'
    end
  end

  def new
    @department=Department.new
  end

  def show
    @department=Department.find(params[:id])
  end

  def edit
    @department=Department.find(params[:id])
  end

  def update
    @department=Department.find(params[:id])
    if @department.update(permission_access)
      redirect_to @department
    else
      render 'edit'
    end
  end

  def destroy
    @department=Department.find(params[:id])
    @department.destroy
    redirect_to departments_path
  end
  
  def subregion_options
    puts 'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii'
    render partial: 'subregion_select'
  end

  private

  def permission_access
    params.require(:department).permit(:name,:task,:location,:country_code,:state_code)
  end
end
