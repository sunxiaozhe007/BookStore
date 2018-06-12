package servlet;

import domain.Book;
import org.apache.commons.beanutils.BeanUtils;
import service.BookService;
import util.UUIDUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;

@WebServlet(name = "AddServlet",urlPatterns = {"/add"})
public class AddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        Book book = new Book();
        try {
            BeanUtils.populate(book,request.getParameterMap());
            book.setId(UUIDUtil.getUUID());
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        BookService bookService = new BookService();
        try {
            bookService.add(book);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("list").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
