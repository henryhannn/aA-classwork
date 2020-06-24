class Employee 
    attr_accessor :salary, :boss
    def initialize(name, salary, title, boss = nil) 
        @name = name 
        @salary = salary
        @title = title 
        @boss = boss
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
    end
end

class Manager < Employee
    attr_reader :employees

    def initialize(name, salary, title, boss = nil)
        super
        @employees = []
    end
    
    def set_employees(employees) 
        @employees = employees
    end 

    def bonus(multiplier)
        self.total_employee_salary * multiplier
    end

    def total_employee_salary
        total_salary = 0
        self.employees.each do |employee|
            if employee.is_a?(Manager)
                total_salary += employee.salary + employee.total_employee_salary
            else
                total_salary += employee.salary
            end
        end
        total_salary
    end
end
p ned = Manager.new("Ned", 1000000, "Founder", nil)
p "---------------------"
p darren = Manager.new("Darren", 78000, "TA Manager", ned)
p "---------------------"
p shawna = Employee.new("Shawna", 12000, "TA", darren)
p "---------------------"
p david = Employee.new("David", 10000, "TA", darren)

ned.set_employees([darren])
darren.set_employees([shawna, david])
darren.boss = ned
p "---------------------"

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000