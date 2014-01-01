class EmployeesController < ApplicationController
  def index
    if params[:search] && params[:search].length>0
      @employees = Employee.search(params[:search]).paginate(:page => params[:page], :per_page => 5)
      # @employees = Employee.paginate :per_page => 10, :page => params[:page], :joins => :employees, :department => ['employees.name LIKE ? OR department.name LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%"]
    else
      @employees=Employee.all
    end
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
    @employee = Employee.find(params[:id])
    # @employee = Employee.find(params[:id],:include => :department)
    # @department=Department.find(@employee.department_id)
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
    params.require(:employee).permit(:name,:post,:email,:email_confirmation,:salery,:department_id)
  end
end
