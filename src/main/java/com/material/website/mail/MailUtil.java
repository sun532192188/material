package com.material.website.mail;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.Set;

import javax.activation.DataSource;
import javax.activation.URLDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.zh.validate.util.Validator;

import com.material.website.util.PropertiesUtil;

/**
 * 邮件发送工具类(功能描述) 
 * @author sunxiaorong
 *
 */
public class MailUtil {

    private JavaMailSender    mailSender;
    private MimeMessageHelper helper;
    private MimeMessage       msg;
    private        String[] emails = null;
    private static final MailUtil util = new MailUtil();
    private MailUtil(){}
    
    public void init(JavaMailSender jms) {
    	this.mailSender = jms;
    }

    public static MailUtil getInstance() {
        return util;
    }

    /**
     *实现了、发邮件的方法 <br/>
     * 邮件对象
    */
    public void send(Mail mail) throws RuntimeException {
        try {
            Date startDate = new Date();
            System.out.println("--------------开始发送邮件"+startDate.getTime()+"------------");
            msg = mailSender.createMimeMessage();
            helper = new MimeMessageHelper(msg,true,"utf-8");

            boolean ready = false;

            int fr = this.checkEmailFormat(mail.getFrom());
            if(fr == 2) {
                helper.setFrom(mail.getFrom());
            } else if(fr == 1){
                throw new RuntimeException("抱歉，发件人邮箱格式不正确");
            } else {
                helper.setFrom(PropertiesUtil.newInstance().loadValue("mail.from",
                        "javamail.properties"));
            }

            int tr = this.checkEmailFormat(mail.getTo());
            if (tr == 2) {
                helper.setTo(emails);
                ready = true;
            } else if (tr == 1) {
                throw new RuntimeException("抱歉，收件人邮箱格式不正确");
            }

            int cr = this.checkEmailFormat(mail.getCc());
            if(cr == 2) {
                helper.setCc(emails);
                ready = true;
            } else if(cr == 1) {
                throw new RuntimeException("抱歉，抄送地址邮箱格式不正确");
            }

            int br = this.checkEmailFormat(mail.getBcc());
            if(br == 2) {
                helper.setBcc(emails);
            } else if (br == 1) {
                throw new RuntimeException("抱歉，密送地址邮箱格式不正确");
            }

            helper.setSubject(mail.getSubject());


            //TODO 处理嵌入图片的问题
            helper.setText(mail.getContent(),true);

            /**
             * 为邮件添加本地附件
             */
            if (mail.getLocalAttr() != null && !mail.getLocalAttr().isEmpty()) {
                Set<String> attrKeys = mail.getLocalAttr().keySet();
               if(attrKeys.size() > 0) {
                    for(String key:attrKeys) {
                        helper.addAttachment(key,mail.getLocalAttr().get(key));
                    }
                }
            }

            /**
             * 添加远程地址上的附件
             */
            if (mail.getRemoteAttr() != null && mail.getRemoteAttr().size() > 0) {
               for (String attr:mail.getRemoteAttr()) {
                   DataSource dataSource = new URLDataSource(new URL(attr));
                   String attrName = attr.substring(attr.lastIndexOf("/")+1);
                   helper.addAttachment(attrName,dataSource);
               }
            }

            if(ready) {
                mailSender.send(msg);
            } else {
                throw new RuntimeException("抱歉，收件地址或抄送地址至少填写一个");
            }

            System.out.println("-------------------邮件发送完毕--用时"+(new Date().getTime()-startDate.getTime())+"ms--------------------");
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (MalformedURLException e) {
            throw new RuntimeException("抱歉，你选择的URL文件可能已被删除，请重新选择附件");
        }
    }



    /**
     * 用来检查一组邮件格式是否正确,如果正确则设置helper的值            <br/>
     * @param email  传入一个字符串，以逗号分隔      <br/>
     * @return    若没有值 返回0 ，若格式不正确返回1，检查没错误返回2              <br/>
     * @throws MessagingException 若地址有误，则抛出该异常
     */
    private int checkEmailFormat(String email) {

        if(email == null || "".equals(email.trim())) {
            return 0;
        } else {
            //TODO 这里需要添加收件人，抄送，密送的昵称信息
            emails = email.split(",");
            for(String str:emails) {
                if(!Validator.getInstance().validateEmail(str)) {
                    return 1;
                }
            }
            return 2;
        }
    }
}
