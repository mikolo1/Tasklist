package servlet;

import repositories.ToDoListRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/main")
public class MainPageController extends HttpServlet {

    ToDoListRepository tasksRepository = new ToDoListRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.removeAttribute("userExists");
        HttpSession session = request.getSession();
        session.removeAttribute("userExists");
//        List<ToDoList> toDoLists = tasksRepository.findAll();
//        request.setAttribute("list", toDoLists);
        if(request.getParameter("logout")!=null){
            session.removeAttribute("user");
            session.removeAttribute("userregistered");
            response.sendRedirect("main");
            return;
        }
        request.getRequestDispatcher("mainpage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String languageCookie = request.getParameter("language");
        if (languageCookie != null) {
            Cookie cookie = new Cookie("language", languageCookie);
            response.addCookie(cookie);
            response.sendRedirect("main");
            return;
        }
        request.getRequestDispatcher("mainpage.jsp").forward(request, response);
    }
}
