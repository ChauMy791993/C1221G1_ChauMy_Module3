<%--
  Created by IntelliJ IDEA.
  User: chaumy
  Date: 13/04/2022
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>Calculator</title>
  </head>
  <body>

  <form action="/calculator" method="post">
    <fieldset style="width: 30%">
      <legend><h2>Simple Calculator</h2></legend>
      <table>
        <tr>
          <td>First Operand :</td>
          <td><input type="number" placeholder="first Operand" name="first-operand"></td>
        </tr>
        <tr>
          <td>Operator :</td>
          <td>
            <select name="operator">
              <option value="+">Addition</option>
              <option value="-">Subtraction</option>
              <option value="*">Multiplication</option>
              <option value="/">Division</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Second Operand :</td>
          <td><input type="number" placeholder="second Operand"  name="second-operand"></td>
        </tr>
        <tr>
          <td></td>
          <td><input type="submit" value="Calculator"></td>
        </tr>

      </table>
    </fieldset>

  </form>
  </body>
</html>
