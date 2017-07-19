
package com.material.website.mail;

/**
 * 邮件发送线程/通过获取队列中的邮件任务发送邮件 
 * @author sunxiaorong
 *
 */
public class SendMailThread implements Runnable {
    @Override
    public void run() {
        while (true) {
            Mail mail = MailQueue.getInstance().get();
            MailUtil.getInstance().send(mail);
        }
    }
}
