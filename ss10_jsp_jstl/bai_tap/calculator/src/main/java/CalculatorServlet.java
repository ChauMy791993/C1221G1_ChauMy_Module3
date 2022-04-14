import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = "";
        double firstOperand = 0;
        double secondOperand = 0;
        double result = 0;

        try {
            firstOperand = Double.parseDouble(request.getParameter("first-operand"));
            secondOperand = Double.parseDouble(request.getParameter("second-operand"));
        } catch (NumberFormatException numberFormatException) {
            message = "not null";
        }

        char operator = request.getParameter("operator").charAt(0);
        try {
            result = Calculator.calculate(firstOperand, secondOperand, operator);
        } catch (RuntimeException runtimeException) {
            message = runtimeException.getMessage();
        }


        request.setAttribute("firstOperand", firstOperand);
        request.setAttribute("secondOperand", secondOperand);
        request.setAttribute("operator", operator);
        request.setAttribute("result", result);
        request.setAttribute("message", message);
        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }
}
