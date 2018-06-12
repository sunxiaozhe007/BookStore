package servlet;

import domain.Book;
import service.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "FindIdServlet",urlPatterns = {"/findId"})
public class FindIdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        System.out.println(id);

        BookService bookService = new BookService();
        try {
           Book book = bookService.findId(id);
           System.out.println(book);
           request.setAttribute("book",book);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/admin/products/edit.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
