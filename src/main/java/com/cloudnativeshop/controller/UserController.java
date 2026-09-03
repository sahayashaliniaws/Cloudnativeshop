package com.cloudnativeshop.controller;

import com.cloudnativeshop.model.User;
import com.cloudnativeshop.repository.UserRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {

    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping
    public List<User> getUsers() {
        return userRepository.findAll();
    }

    @PostMapping
    public User registerUser(@RequestBody User user) {
        return userRepository.save(user);
    }
}
