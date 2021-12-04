package com.example.client.controller;

import com.example.client.JustDataSet;
import com.example.client.ServerAPI;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ClientController {

    private final ServerAPI serverAPI;

    public ClientController(ServerAPI serverAPI) {
        this.serverAPI = serverAPI;
    }

    @GetMapping(value = "/")
    public JustDataSet getData (){

        return serverAPI.getData();
    }
}
