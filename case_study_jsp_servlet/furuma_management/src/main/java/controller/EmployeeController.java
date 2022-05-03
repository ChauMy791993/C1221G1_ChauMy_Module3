package controller;

import model.customer.Customer;
import model.customer.CustomerType;
import model.employee.Division;
import model.employee.EducationDegree;
import model.employee.Employee;
import model.employee.Position;
import service.IDivisonService;
import service.IEducationDegreeService;
import service.IEmployeeService;
import service.IPositionService;
import service.ipml.DvisionServiceImpl;
import service.ipml.EducationDegreeServiceImpl;
import service.ipml.EmployeeServiceImpl;
import service.ipml.PositionServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeController", value = {"/employee"})
public class EmployeeController extends HttpServlet {
    IEmployeeService iEmployeeService = new EmployeeServiceImpl();
    IDivisonService iDivisonService = new DvisionServiceImpl();
    IEducationDegreeService iEducationDegreeService = new EducationDegreeServiceImpl();
    IPositionService iPositionService = new PositionServiceImpl();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
            case "edit":
                updateEmployee(request, response);
                break;
            default:
                listEmployee(request, response);
        }
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) {
        Integer employeeId = Integer.parseInt(request.getParameter("id"));
        String employeeName = request.getParameter("name");
        String employeeBirthday = request.getParameter("birthday");
        String employeeIdCard = request.getParameter("idCard");
        Integer salary = Integer.parseInt(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Integer position = Integer.parseInt(request.getParameter("idPosition"));
        Integer educationDegree = Integer.parseInt(request.getParameter("idEducationDegree"));
        Integer division = Integer.parseInt(request.getParameter("idDivision"));
        Employee employee = new Employee
                (employeeId, employeeName, employeeBirthday, employeeIdCard, salary, phone, email, address, position,educationDegree,division);
        iEmployeeService.editEmployee(employee);
        request.setAttribute("message", "User information was updated");
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) {
        String employeeName = request.getParameter("name");
        String employeeBirthday = request.getParameter("birthday");
        String employeeIdCard = request.getParameter("idCard");
        Integer salary = Integer.parseInt(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Integer position = Integer.parseInt(request.getParameter("idPosition"));
        Integer educationDegree = Integer.parseInt(request.getParameter("idEducationDegree"));
        Integer division = Integer.parseInt(request.getParameter("idDivision"));
        Employee employee = new Employee
                (employeeName, employeeBirthday, employeeIdCard, salary, phone,email,address,position,educationDegree,division);
        iEmployeeService.insertEmployee(employee);
        request.setAttribute("message", "create successful !");
        this.listEmployee(request, response);
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        iEmployeeService.deleteEmployee(id);
        request.setAttribute("message", "delete successful !");
        this.listEmployee(request, response);
    }
    private void listEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = iEmployeeService.displayEmployeeList();
        List<Position> positionList = iPositionService.displayPositionList();
        List<EducationDegree> educationDegreeList = iEducationDegreeService.displayEducationDegreeList();
        List<Division> divisionList = iDivisonService.displayDivisionList();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("", divisionList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateEmployee(request, response);
                break;
            case "search":
                showSearchEmployee(request, response);
                break;
            case "edit":
                showEditEmployee(request, response);
                break;
            default:
                listEmployee(request, response);
        }
    }

    private void showEditEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = iEmployeeService.findEmployeeById(id);
        request.setAttribute("employeeList", employee);
        List<Position> positionList = iPositionService.displayPositionList();
        List<EducationDegree> educationDegreeList = iEducationDegreeService.displayEducationDegreeList();
        List<Division> divisionList = iDivisonService.displayDivisionList();
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("divisionList", divisionList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showSearchEmployee(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("searchById");
        String name = request.getParameter("searchByName");
        String phone = request.getParameter("searchByPhone");
        List<Employee> employeeList = iEmployeeService.findEmployee(id, name, phone);
        request.setAttribute("employeeList", employeeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Position> positionList = iPositionService.displayPositionList();
        request.setAttribute("positionList", positionList);
        List<EducationDegree> educationDegreeList = iEducationDegreeService.displayEducationDegreeList();
        request.setAttribute("educationDegreeList", educationDegreeList);
        List<Division> divisionList = iDivisonService.displayDivisionList();
        request.setAttribute("divisionList", divisionList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
