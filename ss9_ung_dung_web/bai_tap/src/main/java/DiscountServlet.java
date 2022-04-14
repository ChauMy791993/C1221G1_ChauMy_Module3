import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DiscountServlet", value = "/discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String product = request.getParameter("product");
        double price = Float.parseFloat(request.getParameter("price"));
        double percent = Float.parseFloat(request.getParameter("percent"));

        double amonut = price * percent * 0.01;
        double discountPrice = price - amonut;
        request.setAttribute("productDescription",product);
        request.setAttribute("discountAmount",amonut);
        request.setAttribute("discountPrice",discountPrice);
        request.getRequestDispatcher("/result-client.jsp").forward(request,response);
    }
}
