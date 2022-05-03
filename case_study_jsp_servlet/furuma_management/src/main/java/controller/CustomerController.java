package controller;

import model.customer.Customer;
import model.customer.CustomerType;
import service.ICustomerService;
import service.ipml.CustomerServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerController", value = {"/customer"})
public class CustomerController extends HttpServlet {
    private ICustomerService iCustomerService = new CustomerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "search":
                searchProduct(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            default:
                listCustomer(request, response);
                break;
        }
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String typeId = request.getParameter("typeSearch");
        List<Customer> customerList = iCustomerService.search(name, address, typeId);
        request.setAttribute("customerList", customerList);
        List<CustomerType> customerTypeList = iCustomerService.showListCustomerType();
        request.setAttribute("customerTypeList", customerTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = iCustomerService.findCustomerById(id);
        request.setAttribute("customerList", customer);
        List<CustomerType> customerTypeList = iCustomerService.showListCustomerType();
        request.setAttribute("customerTypeList", customerTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = iCustomerService.showListCustomerType();
        request.setAttribute("customerTypeList", customerTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        Integer idCustomer = Integer.parseInt(request.getParameter("id"));
        iCustomerService.delete(idCustomer);
        request.setAttribute("message", "delete successful !");
        this.listCustomer(request, response);
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = iCustomerService.showListCustomer();
        List<CustomerType> customerTypeList = iCustomerService.showListCustomerType();
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "edit":
                updateCustomer(request, response);
                break;
            default:
                break;
        }

    }


    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        Integer idCustomer = Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        Integer gender = Integer.valueOf(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Integer type = Integer.valueOf(request.getParameter("type"));
        Customer customer = new Customer(idCustomer, name, dateOfBirth, gender, idCard, phone, email, address, type);
        iCustomerService.editCustomer(customer);
        request.setAttribute("message", "User information was updated");
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        Integer gender = Integer.valueOf(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Integer type = Integer.valueOf(request.getParameter("type"));
        Customer customer = new Customer(name, dateOfBirth, gender, idCard, phone, email, address, type);
        iCustomerService.createCustomer(customer);
        request.setAttribute("message", "New customer was created");
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
