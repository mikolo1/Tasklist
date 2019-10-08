package repositories;

import model.ToDoList;
import model.User;
import org.hibernate.Session;
import utils.HibernateUtil;

import java.util.List;

public class ToDoListRepository {

    public ToDoList findById(long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        ToDoList td = session.find(ToDoList.class, id);
//        ToDoList toDoList = session.createQuery("from ToDoList WHERE id=:id", ToDoList.class).setParameter("id", id).getSingleResult();
        session.close();
        return td;
    }

    public List<ToDoList> findByUser(User user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<ToDoList> toDoList = session.createQuery("from ToDoList WHERE user=:user", ToDoList.class).setParameter("user", user).getResultList();
        session.close();
        return toDoList;
    }

    public List<ToDoList> findAll() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        List<ToDoList> toDoListList = session.createQuery("from ToDoList", ToDoList.class).getResultList();
        session.close();
        return toDoListList;
    }

    public ToDoList addTask(ToDoList toDoList) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.persist(toDoList);
        session.close();
        return toDoList;
    }

    public ToDoList updateTask(ToDoList toDoList) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        toDoList = (ToDoList) session.merge(toDoList);
        session.merge(toDoList);
        session.flush();
        session.close();
        return toDoList;
    }

    public void deleteTAsk(ToDoList toDoListToDelete){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(toDoListToDelete);
        session.flush();
        session.close();
    }
}
