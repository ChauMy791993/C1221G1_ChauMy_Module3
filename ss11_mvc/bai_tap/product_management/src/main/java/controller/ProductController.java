package controller;

import model.Product;
import service.IProductService;
import service.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductController", urlPatterns = {"/product","/"})
public class ProductController extends HttpServlet {
    private IProductService iProductService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "update":
                showUpdateForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "search" :
                showSearchProduct (request,response);
                break;
            default:
                showListProduct(request, response);
                break;
        }
    }

    private void showSearchProduct(HttpServletRequest request, HttpServletResponse response) {
       RequestDispatcher dispatcher = request.getRequestDispatcher("product/search.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.iProductService.findById(id);

        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error_404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("product/edit.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.iProductService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error_404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("product/delete.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void showListProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = this.iProductService.getListProduct();
        request.setAttribute("product",productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "update":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "search":
                searchProduct (request,response);
            default:
                showListProduct(request, response);
                break;
        }
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        List<Product> productList = this.iProductService.findByName(name);
        if(productList == null){
            request.setAttribute("message","Không tồn tại sản phầm này!");
            showListProduct(request,response);
        }else{
            request.setAttribute("productList",productList);
            request.getRequestDispatcher("product/search.jsp").forward(request,response);
        }
    }


    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = (int) (Math.random() * 100);
        String name = request.getParameter("name");
        Double price = Double.parseDouble(request.getParameter("price"));
        String manufactor = request.getParameter("manufactor");
        Product product = new Product(id, name, price, manufactor);
        this.iProductService.create(product);
        request.setAttribute("message", "New customer was created");
        showListProduct(request,response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Double pirce = Double.parseDouble(request.getParameter("price"));
        String manufactor = request.getParameter("manufactor");
        Product product = this.iProductService.findById(id);
        if (product == null) {
            request.getRequestDispatcher("error_404.jsp");
        } else {
            product.setName(name);
            product.setPrice(pirce);
            product.setManufactor(manufactor);
            this.iProductService.updateProduct(id, product);
            request.setAttribute("message", "Updated Information success");
            showListProduct(request,response);
        }
    }


    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.iProductService.findById(id);

        if (product == null) {
            request.getRequestDispatcher("error_404.jsp");
        } else {
            this.iProductService.deleteProduct(product);
            request.setAttribute("message", "Delete Success");
            showListProduct(request,response);
        }
    }


}
