package controller;

import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List <Product> productList = new ArrayList<>();
        productList.add(new Product("Mai Văn Đoàn","1983-08-20","Hà Nội","img/img1.jpeg"));
        productList.add(new Product("Nguyễn Văn Nam","1983-08-21","Bắc Giang","img/img2.jpeg"));
        productList.add(new Product("Nguyễn Thái Hòa","1983-08-22","Nam Định","img/img3.jpeg"));
        productList.add(new Product("Trần Đăng Khoa","1983-08-23","Hà Tây","img/img4.jpeg"));
        productList.add(new Product("Nguyễn Đình Thi","1983-08-24","Hà Nội","img/img5.jpeg"));
        request.setAttribute("products",productList);
        request.getRequestDispatcher("list.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
