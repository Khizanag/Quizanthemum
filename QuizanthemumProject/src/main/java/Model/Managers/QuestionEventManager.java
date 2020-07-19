package Model.Managers;

import Controller.Classes.Quiz.QuestionEvent;
import Model.DatabaseConnector;

import javax.servlet.ServletContext;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class QuestionEventManager {

    private ServletContext context;
    private Connection connection;
    private Statement statement;

    public QuestionEventManager(){
        this.connection = DatabaseConnector.getInstance();
        try {
            statement = connection.createStatement();
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }

    // TODO
    public QuestionEvent getQuestionEvent(int id) {
        return null;
    }

    public void setContext(ServletContext context){
        this.context = context;
    }
}
