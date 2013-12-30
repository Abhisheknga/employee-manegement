class EmployeesController < ApplicationController
  def index
    @employees=Employee.all
  end

  def create
    # render text: params[:employee].inspect
    @employee=Employee.new(permission_access)
    if @employee.save
      redirect_to @employee
    else
      render 'new'
    end
  end

  def new
    @employee=Employee.new
  end

  def show
    @employee=Employee.find(params[:id])
    @department=Department.find(@employee.department_id)
  end

  def edit
    @employee=Employee.find(params[:id])
  end

  def update
    @employee=Employee.find(params[:id])
    if @employee.update(permission_access)
      redirect_to @employee
    else
      render 'edit'
    end
  end

  def destroy
    @employee=Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path
  end

  private

  def permission_access
    params.require(:employee).permit(:name,:post,:salery,:department_id)
  end
end
