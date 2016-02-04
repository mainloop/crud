package ru.mainloop.test.dao;

import java.util.List;
import ru.mainloop.test.domain.User;

public interface UserDAO {

	public void addUser(User user);

	public List<User> listUser();

	public void removeUser(Integer id);

	public User getUser( Integer id );

	public void setUser( User user);

}