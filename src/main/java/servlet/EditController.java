package servlet;

import model.ToDoList;
import org.apache.commons.lang3.StringUtils;
import repositories.ToDoListRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/edittodo")
public class EditController extends HttpServlet {

    ToDoListRepository tasksRepository = new ToDoListRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        ToDoList toDoList = tasksRepository.findById(Long.parseLong(request.getParameter("taskid")));
        request.setAttribute("task", toDoList);
        request.getRequestDispatcher("edittodo.jsp").forward(request, response);
    }

}
