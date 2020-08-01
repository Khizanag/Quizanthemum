package Model.Managers;

import Configs.CategoriesTableConfig;
import Configs.QuestionEventTableConfig;
import Controller.Classes.Quiz.Question.Question;
import Controller.Classes.Quiz.Question.QuestionEvent;
import Model.DatabaseConnector;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static Configs.Config.QUESTION_MANAGER_STR;

public class CategoriesManager implements CategoriesTableConfig {

    private ManagersManager manager;
    private Connection connection;

    public CategoriesManager(ManagersManager manager){
        this.manager = manager;
        this.connection = DatabaseConnector.getInstance();
    }

    public ManagersManager getManager(){ return this.manager; }

}
