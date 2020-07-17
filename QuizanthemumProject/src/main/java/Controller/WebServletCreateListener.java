package Controller;

import Model.DatabaseConnector;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.Connection;

@WebListener
public class WebServletCreateListener implements ServletContextListener, Config {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();

        // set connection
        Connection connection = DatabaseConnector.getInstance();
        context.setAttribute(CONNECTION_STR, connection);

        // set challenge manager

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        DatabaseConnector.closeConnection();
    }
}