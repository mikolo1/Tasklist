package repositories;

import model.User;
import org.hibernate.Session;
import utils.HibernateUtil;

import javax.persistence.NoResultException;
import java.util.List;

public class UserRepository {

    public User findById(long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        User user = session.find(User.class, id);
//        ToDoList toDoList = session.createQuery("from ToDoList WHERE id=:id", ToDoList.class).setParameter("id", id).getSingleResult();
        session.close();
        return user;
    }

    public User findByLogin(String email) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        User user = null;
        try {
            user = session.createQuery("from User WHERE email=:email", User.class).setParameter("email", email).getSingleResult();
        } catch (NoResultException no) {

        }
        session.close();
        return user;
    }

    public List<User> findAll() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        List<User> userList = session.createQuery("from User", User.class).getResultList();
        session.close();
        return userList;
    }

    public User addUser(User user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.persist(user);
        session.close();
        return user;
    }

    public User updateUser(User user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        user = (User) session.merge(user);
        session.merge(user);
        session.flush();
        session.close();
        return user;
    }

    public void deleteUser(User userToDelete) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(userToDelete);
        session.flush();
        session.close();
    }
}
