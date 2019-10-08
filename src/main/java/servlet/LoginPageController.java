package servlet;

import model.ToDoList;
import model.User;
import org.apache.commons.lang3.StringUtils;
import repositories.ToDoListRepository;
import repositories.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginPageController extends HttpServlet {

    ToDoListRepository tasksRepository = new ToDoListRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("userExists");
        request.getRequestDispatcher("loginpage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserRepository userRepository = new UserRepository();
        HttpSession session = request.getSession();
        if (StringUtils.isNotBlank(request.getParameter("login")) && StringUtils.isNotBlank(request.getParameter("password"))) {
            String login = request.getParameter("login");
            String password = request.getParameter("password");
            User user = userRepository.findByLogin(login);
            if(user!=null && user.getPassword().equals(password)){
                session.setAttribute("user", user);
                response.sendRedirect("todo");
                return;
            }else {
                session.setAttribute("userNotFound", "notExists");
                response.sendRedirect("login");
                return;
            }
        }
        request.getRequestDispatcher("loginpage.jsp").forward(request, response);
    }
}
