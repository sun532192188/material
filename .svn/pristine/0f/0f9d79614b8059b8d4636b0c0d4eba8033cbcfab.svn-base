package com.material.website.mail;
import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * 邮件DTO(功能描述) 
 * @author sunxiaorong
 *
 */
public class Mail {
    /**
     * 发件人
     */
    private String from;
    /**
     * 收件人 多个以逗号隔开
     */
    private String to;
    /**
     * 邮件主题
     */
    private String subject;
    /**
     * 抄送     多个以逗号隔开
     */
    private String cc;
    /**
     * 暗送     多个以逗号隔开
     */
    private String bcc;
    /**
     * 邮件内容
     */
    private String content;
    /**
     * 本地附件
     */
    private Map<String,File> localAttr;
    /**
     * 远程地址附件，存储附件的远程地址
     */
    private List<String> remoteAttr;
    /**
     * 是否内嵌图片
     */
    private boolean implant;

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

    public String getBcc() {
        return bcc;
    }

    public void setBcc(String bcc) {
        this.bcc = bcc;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Map<String, File> getLocalAttr() {
        return localAttr;
    }

    public void setLocalAttr(Map<String, File> localAttr) {
        this.localAttr = localAttr;
    }

    public List<String> getRemoteAttr() {
        return remoteAttr;
    }

    public void setRemoteAttr(List<String> remoteAttr) {
        this.remoteAttr = remoteAttr;
    }

    public boolean isImplant() {
        return implant;
    }

    public void setImplant(boolean implant) {
        this.implant = implant;
    }

    public Mail(){}

    /**
     *处理简单邮件发送，使用默认发件人发送               <br/>
     * @param to        收件地址 ，可以用逗号分隔开      <br/>
     * @param subject   邮件主题                         <br/>
     * @param content   邮件内容                         <br/>
     * @throws com.ld365.ldshop.exception.LdshopException 抛出发件异常
     */
    public Mail(String to, String subject, String content) {
        this.to = to;
        this.subject = subject;
        this.content = content;
    }

    public Mail(String from, String to, String subject, String content) {
        this(to,subject,content);
        this.from = from;
    }
}
