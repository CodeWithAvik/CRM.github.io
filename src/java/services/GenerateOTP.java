/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import java.util.Random;

/**
 *
 * @author ayanp
 */
public class GenerateOTP {

    public static int generate() {
        Random r = new Random(System.currentTimeMillis());
        return ((1 + r.nextInt(5)) * 100000 + r.nextInt(100000));
    }
}
