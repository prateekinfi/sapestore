package com.sapient.service;


import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

@Service
@PropertySource("classpath:sapestore.properties")
public class EmailServiceImpl implements IEmailService{
	Logger logger = LoggerFactory.getLogger("sapestore");
	@Value("${mailHost}")
	String mailHost;
	
	@Value("${mailFrom}")
	String mailFrom;
	
    @Override
    public void sendMail(String toEmail, String subject, String sendMessage) {
        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", mailHost);
        Session session = Session.getDefaultInstance(properties);
        try {

           MimeMessage message = new MimeMessage(session);
           logger.debug(mailFrom);
           logger.debug(mailHost);
           message.setFrom(new InternetAddress(mailFrom));

           message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

           message.setSubject(subject);
         
           message.setContent(sendMessage, "text/html");

           Transport.send(message);
           logger.debug("Sent message successfully....");
        } catch (MessagingException mex) {
           mex.printStackTrace();
           logger.error(mex.getMessage());
        }
    }

    
}
