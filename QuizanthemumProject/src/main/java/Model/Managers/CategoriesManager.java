package Model.Managers;

import Configs.CategoriesTableConfig;
import Configs.QuestionEventTableConfig;
import Controller.Classes.OtherClasses.Category;
import Controller.Classes.Quiz.Question.Question;
import Controller.Classes.Quiz.Question.QuestionEvent;
import Controller.Classes.Quiz.Quiz;
import Model.DatabaseConnector;

import javax.xml.crypto.Data;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static Configs.Config.DEFAULT_ID;
import static Configs.Config.QUESTION_MANAGER_STR;
import static Configs.QuizTableConfig.QUIZ_TABLE_COLUMN_3_CATEGORY_ID;
import static Configs.QuizTableConfig.QUIZ_TABLE_NAME;

public class CategoriesManager implements CategoriesTableConfig {

    private ManagersManager manager;
    private Connection connection;

    public CategoriesManager(ManagersManager manager){
        this.manager = manager;
        this.connection = DatabaseConnector.getInstance();
    }

    public ManagersManager getManager(){ return this.manager; }

    /* returns ID of category which was added into database */
    public int insertCategory(Category category){
        String query = "INSERT INTO " + CATEGORIES_TABLE_NAME
                + " VALUES (null, " + category.getName() + ")"
                + ";\n";
        try{
            Statement statement = connection.createStatement();
            statement.execute(query);
            int ID = DatabaseConnector.getLastInsertID();
            return ID;
        } catch (SQLException throwables) {
            System.out.println("Error during creating statement or executing query during inserting Category");
            throwables.printStackTrace();
        }
        return DEFAULT_ID;
    }

    public Category getCategory(int ID){
        String query = "SELECT *"
                + " FROM " + CATEGORIES_TABLE_NAME
                + " WHERE " + CATEGORIES_TABLE_COLUMN_1_ID + " = " + ID
                + ";\n";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            if(resultSet.next()){
               return buildCategory(resultSet);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public List<Category> getCategories(){
        String query = "SELECT *"
                + " FROM " + CATEGORIES_TABLE_NAME;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            List<Category> categories = new ArrayList<>();
            while(resultSet.next()){
                categories.add(buildCategory(resultSet));
            }
            return categories;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null; // error has occured
    }

    private Category buildCategory(ResultSet resultSet){
        try {
            int ID = resultSet.getInt(CATEGORIES_TABLE_COLUMN_1_ID);
            String name = resultSet.getString(CATEGORIES_TABLE_COLUMN_2_NAME);
            return new Category(ID, name);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

}
