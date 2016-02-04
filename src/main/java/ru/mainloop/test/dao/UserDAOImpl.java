package ru.mainloop.test.dao;

import java.util.List;

import org.hibernate.classic.Session;
import ru.mainloop.test.domain.User;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addUser(User user) {
		sessionFactory.getCurrentSession().save(user);
	}

	@SuppressWarnings("unchecked")
	public List<User> listUser() {

		return sessionFactory.getCurrentSession().createQuery("from User").list();
	}

	public void removeUser(Integer id) {
		User user = (User) sessionFactory.getCurrentSession().load(	User.class, id);
		if (null != user) {
			sessionFactory.getCurrentSession().delete(user);
		}

	}

	public User getUser(Integer id) {
		User user = new User();
		User u = (User)sessionFactory.getCurrentSession().load(User.class, id);
		user.setAge( u.getAge() );
		user.setName( u.getName());
		user.setAdmin( u.getAdmin() );
		user.setId( u.getId() );
		user.setCreatedDate( u.getCreatedDate());
		return user;
	}

	public void setUser( User user) {
		Session session = sessionFactory.getCurrentSession();
		User existingUser = (User)session.get( User.class, user.getId());
		existingUser.setName( user.getName() );
		existingUser.setAge( user.getAge() );
		existingUser.setAdmin( user.getAdmin() );
		session.save(existingUser);
	}
}
