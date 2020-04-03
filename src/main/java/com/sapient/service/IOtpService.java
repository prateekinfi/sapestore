package com.sapient.service;

import com.sapient.entity.Login;

public interface IOtpService {
	 int generateOTP();
	 String generateToken();
	 boolean verifyToken(Login login,String tokenId);
}
