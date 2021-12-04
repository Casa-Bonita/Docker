package com.example.server.controller;

import com.example.server.JustDataSet;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ServerController {

    private int i = 0;

    @GetMapping(value = "/counter")
    public JustDataSet getData() {

        return new JustDataSet(i++);
    }
}
