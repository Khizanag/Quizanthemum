package Model.Managers;

import Controller.Classes.Quiz.QuizEvent;
import Model.DatabaseConnector;

import javax.servlet.ServletContext;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class QuizEventManager {

    private ServletContext context;
    private Connection connection;
    private Statement statement;

    public QuizEventManager(){
        this.connection = DatabaseConnector.getInstance();
        try {
            statement = connection.createStatement();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void setContext(ServletContext context){
        this.context = context;
    }

}
