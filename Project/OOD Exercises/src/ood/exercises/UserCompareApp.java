/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ood.exercises;

import java.util.Arrays;
import java.util.Scanner;

/**
 *
 * @author Admin
 */
public class UserCompareApp
{

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args)
    {
        // TODO code application logic here

        User user1 = new User(10, "John");
        User user2 = user1;
        User user3 = new User(10, "John");
        User[] userArray = new User[10];
        Scanner input = new Scanner(System.in);

//Memory loaction comparison
        if (user1 == user2) {
            System.out.println("User1 and User2 Equal");
        } else {
            System.out.println("User1 and User2 are not equal");
        }
        if (user1 == user3) {
            System.out.println("User1 and user3 are equal");
        } else {
            System.out.println("User1 and User3 are not Equal");
        }
        if (user2 == user3) {
            System.out.println("User2 and User3 are equal");
        } else {
            System.out.println("User2 and User3 are not equal");
        }
        // Actual Object comparison

        System.out.println("Actual Objects Comaprison");
        if (user1.equals(user2)) {
            System.out.println("User1 and User2 Equal");
        } else {
            System.out.println("User1 and User2 are not equal");
        }
        if (user1.equals(user3)) {
            System.out.println("User1 and user3 are equal");
        } else {
            System.out.println("User1 and User3 are not Equal");
        }
        if (user2.equals(user3)) {
            System.out.println("User2 and User3 are equal");
        } else {
            System.out.println("User2 and User3 are not equal");
        }

        for (int i = 0; i < 10; i++) {
            try {
                System.out.println("Enter usser Id " + i);
                int id=input.nextInt();
                input.nextLine();
                System.out.println("Enter user Name " + i);
                String name=input.nextLine();
                userArray[i]=new User(id,name);

            } catch (Exception e) {
              // System.out.println(e.getMessage());
                e.printStackTrace();
            }
        }
        displayArray(userArray);
        Arrays.sort(userArray);
        
        
        System.out.println("After Sorting");
        displayArray(userArray);

    }

    public static void displayArray(User[] userArray)
    {
        for (int i = 0; i < userArray.length; i++) {
            System.out.println(userArray[i]);
        }
    }
}
