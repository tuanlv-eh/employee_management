require "test_helper"

class EmployeeTest < ActiveSupport::TestCase
  test "employee is valid" do
    employee = Employee.new
    assert employee.valid?
  end

  test "employee has a name" do
    employee = Employee.new(name: "John Doe")
    assert_equal "John Doe", employee.name
  end

  test "employee has a department" do
    employee = Employee.new(department: "Engineering")
    assert_equal "Engineering", employee.department
  end

  test "employee has a valid salary" do
    employee = Employee.new(salary: 5000)
    assert_equal 5000, employee.salary
  end
end
