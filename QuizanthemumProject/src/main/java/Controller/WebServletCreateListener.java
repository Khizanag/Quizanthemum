package Controller;

import Configs.Config;
import Controller.Classes.OtherClasses.Country;
import Model.DatabaseConnector;
import Model.Managers.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;

@WebListener
public class WebServletCreateListener implements ServletContextListener, Config {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        ManagersManager managersManager = new ManagersManager(context);
        sce.getServletContext().setAttribute(MANAGERS_MANAGER_STR, managersManager);
        sce.getServletContext().setAttribute("achievementType", -1);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        DatabaseConnector.closeConnection();
    }
}