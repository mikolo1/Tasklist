package servlet;

import lombok.extern.slf4j.Slf4j;
import model.ToDoList;
import model.User;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import repositories.ToDoListRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@Slf4j
@WebServlet("/todo")
public class ToDoController extends HttpServlet {

    ToDoListRepository tasksRepository = new ToDoListRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<ToDoList> toDoLists = (List<ToDoList>) session.getAttribute("list");
        HttpSession session = request.getSession();
        session.removeAttribute("userNotFound");
        User user = (User) session.getAttribute("user");
        List<ToDoList> toDoLists = tasksRepository.findByUser(user);
        request.setAttribute("list", toDoLists);
        request.setCharacterEncoding("UTF-8");

        if (request.getParameter("taskid") != null) {
            Long id = Long.valueOf(request.getParameter("taskid"));
            ToDoList toDoList = toDoLists.stream().filter(e -> id.equals(e.getId())).findFirst().orElseThrow(RuntimeException::new);
//            toDoLists.remove(toDoList);
            tasksRepository.deleteTAsk(toDoList);
            log.debug("Usunięto zadanie o id:{} ", id);
            response.sendRedirect("todo");
            return;
        }

        if (StringUtils.isNotBlank(request.getParameter("editdescription"))) {
            ToDoList toDoList = tasksRepository.findById(Long.parseLong(request.getParameter("id")));
            toDoList.setDeadLine(StringUtils.isNotBlank(request.getParameter("editDate")) ? LocalDate.parse(request.getParameter("editDate")) : LocalDate.now().plusMonths(1));
            toDoList.setDescription(request.getParameter("editdescription"));
            toDoList.setPriority(StringUtils.isNotBlank(request.getParameter("editPriority")) ? Integer.parseInt(request.getParameter("editPriority")) : 3);
            tasksRepository.updateTask(toDoList);
            request.setAttribute("list", tasksRepository.findAll());
            response.sendRedirect("todo");
            return;
        }

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        String languageCookie = request.getParameter("language");
        if (languageCookie != null) {
            Cookie cookie = new Cookie("language", languageCookie);
            response.addCookie(cookie);
            response.sendRedirect("todo");
            return;
        }
//        List<ToDoList> toDoLists = (List<ToDoList>) session.getAttribute("list");
        User user = (User) session.getAttribute("user");
        List<ToDoList> toDoLists = tasksRepository.findByUser(user);
        request.setAttribute("list", toDoLists);

        if (StringUtils.isNotBlank(request.getParameter("taskdescription"))) {
            ToDoList toDoListElement = new ToDoList();
            toDoListElement.setDeadLine(StringUtils.isNotBlank(request.getParameter("finishDate")) ? LocalDate.parse(request.getParameter("finishDate")) : LocalDate.now().plusMonths(1));
            toDoListElement.setDescription(request.getParameter("taskdescription"));
            toDoListElement.setPriority(StringUtils.isNotBlank(request.getParameter("choosePriority")) ? Integer.parseInt(request.getParameter("choosePriority")) : 3);
            toDoListElement.setUser(user);
            toDoLists.add(toDoListElement);
            tasksRepository.addTask(toDoListElement);
            request.setAttribute("list", tasksRepository.findAll());
            response.sendRedirect("todo");
            return;
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}
