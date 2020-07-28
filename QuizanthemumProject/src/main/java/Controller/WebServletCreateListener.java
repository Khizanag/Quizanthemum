package Controller;

import Configs.Config;
import Model.DatabaseConnector;
import Model.Managers.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class WebServletCreateListener implements ServletContextListener, Config {

    @Override
    public void contextInitialized(ServletContextEvent sce) {

        ServletContext context = sce.getServletContext();
        ManagersManager managersManager = new ManagersManager(context);
        sce.getServletContext().setAttribute(MANAGERS_MANAGER_STR, managersManager);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        DatabaseConnector.closeConnection();
    }
}