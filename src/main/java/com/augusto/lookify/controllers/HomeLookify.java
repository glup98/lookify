package com.augusto.lookify.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HomeLookify {
    
    @RequestMapping("")
    public String Home() {
        return "homeLookify";
    }
}
