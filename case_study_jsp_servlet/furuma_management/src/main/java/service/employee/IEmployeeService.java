package service.employee;

import model.employee.Employee;

import java.util.List;
import java.util.Map;

public interface IEmployeeService {
    List<Employee> displayEmployeeList();

    Map<String, String> insertEmployee(Employee employee);

    void deleteEmployee(Integer id);

    Map<String, String> editEmployee (Employee employee);

    List<Employee> findEmployee(String id, String name,String phone);

    Employee findEmployeeById(int id);
}
