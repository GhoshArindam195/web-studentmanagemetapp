package com.web_employeemanagementsystem.helper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class Helper {

    public static String get_Random_Password(int len) {

        String Capital_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String Small_chars = "abcdefghijklmnopqrstuvwxyz";
        String numbers = "0123456789";
        String symbols = "!@#$%^&*_=+-/.?<>)";

        String values = Capital_chars + Small_chars
                + numbers + symbols;
        Random rndm_method = new Random();

        String password = "";

        for (int i = 0; i < len; i++) {
            password += values.charAt(rndm_method.nextInt(values.length()));

        }
        return password;
    }

    public static String get_Random_OTP(int len) {

        // Using numeric values
        String numbers = "0123456789";

        // Using random method
        Random rndm_method = new Random();

        String otp = "";

        for (int i = 0; i < len; i++) {
            // Use of charAt() method : to get character value
            // Use of nextInt() as it is scanning the value as int
            otp += numbers.charAt(rndm_method.nextInt(numbers.length()));
        }
        return otp;
    }

    public static String getCurrentDate() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        return formatter.format(date).toString();
    }

}
