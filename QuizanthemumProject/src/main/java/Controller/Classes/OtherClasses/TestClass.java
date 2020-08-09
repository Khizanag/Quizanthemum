package Controller.Classes.OtherClasses;

import Configs.LocalDatabaseConfig;

import javax.ejb.Local;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;

import static Configs.Config.*;

public class TestClass implements LocalDatabaseConfig {

    private static final String COUNTRIES_FILE_NAME = "/Users/gigakhizanishvili/Programming/GitHub/Quizanthemum/QuizanthemumProject/src/main/Database/countries.txt";

    public static void main(String[] args){
//        String s = "" + false;
//        System.out.printf(s);
        try {
            BufferedReader br = new BufferedReader(new FileReader(COUNTRIES_FILE_NAME));
            String line = br.readLine();
            System.out.println(line);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
