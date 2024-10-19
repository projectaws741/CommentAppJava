package com.sri.AWSApp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class MessageController {

    @Autowired
    private MessageService messageService;

    @PostMapping("/send")
    public void sendMessage(@RequestBody Message message)
    {
        messageService.saveMessage(message);
    }
    @GetMapping("/messages")
    public List<Message> Mymessages()
    {
        return messageService.fetchMessages();
    }
}
