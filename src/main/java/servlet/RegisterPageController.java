package servlet;

import model.User;
import org.apache.commons.lang3.StringUtils;
import repositories.UserRepository;
import utils.UserUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/register")
public class RegisterPageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("userNotFound");
        request.getRequestDispatcher("registerpage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (StringUtils.isNotBlank(request.getParameter("name"))
                && StringUtils.isNotBlank(request.getParameter("lastName"))
                && StringUtils.isNotBlank(request.getParameter("login"))
                && StringUtils.isNotBlank(request.getParameter("password"))) {
            String email = request.getParameter("login");
            UserRepository userRepository = new UserRepository();
            if (UserUtils.userExists(email)) {
                session.setAttribute("userExists", email);
                response.sendRedirect("register");
                return;
            }
            User user = new User();
            user.setName(request.getParameter("name"));
            user.setLastName(request.getParameter("lastName"));
            user.setEmail(request.getParameter("login"));
            user.setPassword(request.getParameter("password"));
            user.setEmail(request.getParameter("login"));

            userRepository.addUser(user);
            session.removeAttribute("userExists");
            session.setAttribute("userregistered", "success");
            response.sendRedirect("login");
            return;
        }
        request.getRequestDispatcher("registerpage.jsp").forward(request, response);
    }
}
