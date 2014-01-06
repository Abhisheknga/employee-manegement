class EmployeesController < ApplicationController
  def index
    puts params[:search]
    if params[:search] && params[:search].length>0
      @employees = Employee.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
      # @employees = Employee.paginate :per_page => 10, :page => params[:page], :joins => :employees, :department => ['employees.name LIKE ? OR department.name LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%"]
    else
      @employees=Employee.all.paginate(:page => params[:page], :per_page => 10)
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
  
  def _employeelist
    puts '1111111111111111111111111111111111111111111111111111'
    puts params[:search]
    if params[:search] && params[:search].length>0
      puts 'if'
      @employees = Employee.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
    else
      puts 'else'
      @employees=Employee.all.paginate(:page => params[:page], :per_page => 10)
    end
    render partial: 'employeelist'
    # respond_to do |format|
    # format.html
      # if params[:callback]
        # format.js { render :json => {:employees => @employees.to_json}, :callback => params[:callback] }
      # else
        # format.json { render json: {:employees => @employees}}
       # end
    # end
  end
  
  def employee_search
    puts 'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii'
    puts params[:search]
    if params[:search] && params[:search].length>0
      puts 'if'
      @employees = Employee.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
    else
      puts 'else'
      @employees=Employee.all.paginate(:page => params[:page], :per_page => 10)
    end
    render partial: 'employeelist'
  end

  private

  def permission_access
    params.require(:employee).permit(:name,:post,:email,:email_confirmation,:salery,:department_id)
  end
end
