package Model.Managers;

import Configs.CountriesTableConfig;
import Controller.Classes.OtherClasses.Country;
import Model.DatabaseConnector;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import static Configs.Config.DEFAULT_ID;

public class CountriesManager implements CountriesTableConfig {

    private Connection connection;
    private ManagersManager manager;

    public CountriesManager(ManagersManager manager){
        connection = DatabaseConnector.getInstance();
        this.manager = manager;
    }

    public int insertCountry(Country country){
        String query = "INSERT INTO " + COUNTRIES_TABLE_NAME
                + " VALUES(null"
                + ", '" + country.getName() + "'"
                + ");";
        System.out.println("Query in CountriesManager.insert() : " + query);
        try {
            Statement statement = connection.createStatement();
            statement.execute(query);
            statement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return DEFAULT_ID;
    }

    public Country getCountry(int ID){
        String query = "SELECT * "
                + " FROM " + COUNTRIES_TABLE_NAME
                + " WHERE " + COUNTRIES_TABLE_COLUMN_1_ID + " = " + ID;
        try{
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            if(resultSet.next()){
                return buildCountryFromResultSet(resultSet);
            }
            resultSet.close();
            statement.close();
        } catch(SQLException throwables){
            throwables.printStackTrace();
        }
        return null;
    }

    public List<Country> getCountries(){
        List<Country> countries = new ArrayList<>();
        String query = "SELECT * FROM " + COUNTRIES_TABLE_NAME;
        try{
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while(resultSet.next()){
                countries.add(buildCountryFromResultSet(resultSet));
            }
            resultSet.close();
            statement.close();
            return countries;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    /* Resultset should be checked and should have next () */
    private Country buildCountryFromResultSet(ResultSet resultSet){
        try {
            int ID = resultSet.getInt(COUNTRIES_TABLE_COLUMN_1_ID);
            String name = resultSet.getString(COUNTRIES_TABLE_COLUMN_2_NAME);
            return new Country(ID, name, this);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
