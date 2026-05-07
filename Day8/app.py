import logging,time
logging.basicConfig(level=logging.DEBUG,format="---%(levelname)s : %(message)s---")
def new_update(func):
    def logging_details(self, old_val,updated_val):
        logging.info(f"{func.__name__} from {old_val} to {updated_val}---")
        return func(self, old_val,updated_val)
    return logging_details
class Employee:
    def __init__(self,name,id,salary):
        self.id=id
        self.name=name
        self.salary=salary
    def __del__(self):
        print("Logout Successful")
    @new_update
    def salaryUpdated(self,old_sal,new_sal):
        self.salary=new_sal
    @new_update
    def nameUpdated(self,old_name,new_name):
        self.name=new_name
    
logging.info("Entered to Employee Details Page...")
time.sleep(2)
name = input("Enter employee name: ")
emp_id = int(input("Enter employee ID: "))
salary = float(input("Enter employee salary: "))
logging.info("Employee Details that you entered")
emp1 = Employee(name, emp_id, salary)
print(f"Employee name: {emp1.name}")
print(f"Employee salary: {emp1.salary}")
time.sleep(2)
logging.info("Enter Details that need to be updated")
new_salary = float(input("Enter new salary to be updated: "))
new_name = input("Enter name to be edited: ")
emp1.salaryUpdated(emp1.salary,new_salary)
emp1.nameUpdated(emp1.name,new_name)
# logging.warning("Employee data is updated!---")