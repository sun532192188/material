package com.material.website.mail;

import java.util.ArrayList;
import java.util.List;

/**
 *  邮件队列实现(功能描述) 
 * @author sunxiaorong
 *
 */
public class MailQueue {
    private static final MailQueue    instance  = new MailQueue();
    private              List<Mail> container = new ArrayList<Mail>();

    private MailQueue() {

    }

    public static MailQueue getInstance() {
        return instance;
    }

    public synchronized Mail get() {
        if (container.isEmpty()) {
            try {
                this.wait();
            } catch (InterruptedException e) {
            	System.out.println(e.getMessage());
            }
        }
        return container.remove(0);
    }

    public synchronized void put(Mail mail) {
        container.add(mail);
        this.notify();
    }
}
