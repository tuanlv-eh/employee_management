class EmployeesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @employees = Employee.all
    # render json: @employees
  end

  def show
    @employee = Employee.find(params[:id])
    # render json: @employee
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to @employee, notice: 'Employee was successfully created.'
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to @employee, notice: 'Employee was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_url, notice: 'Employee was successfully destroyed.'
  end
  
  private

  def employee_params
    params.require(:employee).permit(:name, :position, :department, :salary)
  end

end
