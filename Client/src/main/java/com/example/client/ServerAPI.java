package com.example.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(name = "Server-API", url = "${server.url}")
public interface ServerAPI {

    @GetMapping(value = "/counter")
    JustDataSet getData();
}
