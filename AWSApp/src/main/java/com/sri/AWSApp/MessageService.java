package com.sri.AWSApp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageService {

    @Autowired
    private MessageRepo messageRepo;


    public void saveMessage(Message message) {
        messageRepo.save(message);
    }

    public List<Message> fetchMessages() {
        return messageRepo.findAll();
    }
}
