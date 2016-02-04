package ru.mainloop.test.web;

import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import ru.mainloop.test.domain.User;
import ru.mainloop.test.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
    

	@RequestMapping("/index")
	public String listUsers(Map<String, Object> map) {
		map.put("userList", userService.listUser());
		return "user";
	}
	
	@RequestMapping("/")
	public String home() {
		return "redirect:/index";
	}


    @RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addUserGet(Model model)
	{
        User user = new User();
        model.addAttribute("user",user);
		return "user-edit";
	}


	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addUserPost(@ModelAttribute("user") User user)
	{
		userService.addUser(user);
		return "redirect:/index";
	}

	@RequestMapping("/delete/{userId}")
	public String deleteContact(@PathVariable("userId") Integer userId) {
		userService.removeUser(userId);
		return "redirect:/index";
	}

	@RequestMapping(value="/user-edit/{userId}", method = RequestMethod.GET)
	public String editUserGet(@PathVariable("userId") Integer userId, Model model ) {
		User user = userService.getUser(userId);
		model.addAttribute("user", user);
		return "user-edit";
	}

	@RequestMapping(value="/user-edit/{userId}", method = RequestMethod.POST)
	public String editUserPost(@PathVariable("userId") Integer userId, @ModelAttribute("user") User user ) {
        User u = userService.getUser(userId);
        user.setId(u.getId());
        user.setCreatedDate(u.getCreatedDate());
		userService.setUser(user);
		return "redirect:/index";
	}

}
