package servlet;

import service.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DeleteAllServlet",urlPatterns = {"/delAllBook"})
public class DeleteAllServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //得到所有id
        String[] ids = request.getParameterValues("ids");

        BookService bookService = new BookService();
        try {
            bookService.delAll(ids);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("list").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
