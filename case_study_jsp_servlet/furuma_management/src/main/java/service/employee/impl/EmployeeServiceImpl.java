package service.employee.impl;

import model.employee.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepositoryImpl;
import service.employee.IEmployeeService;
import utils.RegularExpression;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeServiceImpl implements IEmployeeService {

    IEmployeeRepository iEmployeeRepository = new EmployeeRepositoryImpl();

    @Override
    public List<Employee> displayEmployeeList() {
        return iEmployeeRepository.displayEmployeeList();
    }

    @Override
    public Map<String, String> insertEmployee(Employee employee) {
        Map<String, String> emloyeeError = new HashMap<>();
        if ("".equals(employee.getEmployeeName())) {
            emloyeeError.put("name", "name is not be empty !");
        }
        String salary = String.format("%.0f", employee.getSalary());
        if (employee.getSalary() == null) {
            emloyeeError.put("salary", "salary is not be empty !");
        } else if (!RegularExpression.checkSalary(salary)) {
            emloyeeError.put("salary", "must be positive tens number !");
        }
        if ("".equals(employee.getEmployeeIdCard())) {
            emloyeeError.put("idCard", "id card is not be empty");
        } else if (!RegularExpression.checkIdCard(employee.getEmployeeIdCard())) {
            emloyeeError.put("idCard", "id card is must be 9 numbers or 12 numbers");
        }
        if ("".equals(employee.getPhone())) {
            emloyeeError.put("phone", "phone is not be empty");
        } else if (!RegularExpression.checkPhone(employee.getPhone())) {
            emloyeeError.put("phone", "phone number base on 090xxxxxxx or 091xxxxxxx or (84)+90xxxxxxx or (84)+91xxxxxxx");
        }
        if ("".equals(employee.getEmail())) {
            emloyeeError.put("email", "email is not be empty");
        } else if (!RegularExpression.checkEmail(employee.getEmail())) {
            emloyeeError.put("email", "email base on ...@...dot... ");
        }
        if (emloyeeError.isEmpty()) {
            iEmployeeRepository.insertEmployee(employee);
        }
       return emloyeeError;
    }

    @Override
    public void deleteEmployee(Integer id) {
        iEmployeeRepository.deleteEmployee(id);
    }

    @Override
    public Map<String, String> editEmployee(Employee employee) {
        Map<String, String> emloyeeError = new HashMap<>();
        if ("".equals(employee.getEmployeeName())) {
            emloyeeError.put("name", "name is not be empty !");
        }
        String salary = String.format("%.0f", employee.getSalary());
        if (employee.getSalary() == null) {
            emloyeeError.put("salary", "salary is not be empty !");
        } else if (!RegularExpression.checkSalary(salary)) {
            emloyeeError.put("salary", "must be positive tens number !");
        }
        if ("".equals(employee.getEmployeeIdCard())) {
            emloyeeError.put("idCard", "id card is not be empty");
        } else if (!RegularExpression.checkIdCard(employee.getEmployeeIdCard())) {
            emloyeeError.put("idCard", "id card is must be 9 numbers or 12 numbers");
        }
        if ("".equals(employee.getPhone())) {
            emloyeeError.put("phone", "phone is not be empty");
        } else if (!RegularExpression.checkPhone(employee.getPhone())) {
            emloyeeError.put("phone", "phone number base on 090xxxxxxx or 091xxxxxxx or (84)+90xxxxxxx or (84)+91xxxxxxx");
        }
        if ("".equals(employee.getEmail())) {
            emloyeeError.put("email", "email is not be empty");
        } else if (!RegularExpression.checkEmail(employee.getEmail())) {
            emloyeeError.put("email", "email base on ...@...dot... ");
        }
        if (emloyeeError.isEmpty()) {
            iEmployeeRepository.editEmployee(employee);
        }
        return emloyeeError;
    }

    @Override
    public List<Employee> findEmployee(String id, String name, String phone) {
        return iEmployeeRepository.findEmployee(id, name, phone);
    }

    @Override
    public Employee findEmployeeById(int id) {
        return iEmployeeRepository.findEmployeeById(id);
    }
}
