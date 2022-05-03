package service;

import model.employee.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> displayEmployeeList();

    void insertEmployee(Employee employee);

    void deleteEmployee(Integer id);

    void editEmployee (Employee employee);

    List<Employee> findEmployee(String id, String name,String phone);

    Employee findEmployeeById(int id);
}
