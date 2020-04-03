package com.sapient.service;

import java.security.NoSuchAlgorithmException;

public interface IHashService {
    String generateHash(String password) throws NoSuchAlgorithmException;
}
