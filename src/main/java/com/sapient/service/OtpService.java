package com.sapient.service;

import java.util.Date;
import java.util.Random;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.sapient.entity.Login;

@Service
@PropertySource("classpath:sapestore.properties")
public class OtpService implements IOtpService {

	Logger logger = LoggerFactory.getLogger("sapestore");
	@Value("${tokenTimeOut}")
	private Integer tokenTimeOut;
	@Override
	public int generateOTP() {
		Random random = new Random();
		int otp = 100000 + random.nextInt(900000);
		return otp;
	}

	@Override
	public String generateToken() {
		String uniqueID = UUID.randomUUID().toString();
		return uniqueID;
	}

	@Override
	public boolean verifyToken(Login login,String tokenId) {
		Date tokenSetDate = login.getTokenGeneratedDate();
	    Date currentDate = new Date();
	    long duration = currentDate.getTime()-tokenSetDate.getTime();
		long diffInMinutes = TimeUnit.MILLISECONDS.toMinutes(duration);
		logger.debug("Last Modified date:{}",diffInMinutes);
		if (login.getTokenId().equals(tokenId) && diffInMinutes<tokenTimeOut) {
			return true;
		}
		return false;
	}

}
