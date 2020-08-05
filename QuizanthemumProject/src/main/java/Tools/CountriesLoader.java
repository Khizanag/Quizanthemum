package Tools;

import Controller.Classes.OtherClasses.Country;
import Model.Managers.CountriesManager;
import Model.Managers.ManagersManager;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;


public class CountriesLoader {

    private static final String FILENAME = "src/main/Database/countries.txt";

    public static void main(String[] args){
        buildCountriesDatabase(null);  // dont use managersManagers
    }

    private static void buildCountriesDatabase(ManagersManager managersManager) {
        CountriesManager countriesManager = new CountriesManager(managersManager); // dont use managersManagers
        try{
            FileReader fr = new FileReader(FILENAME);
            BufferedReader br = new BufferedReader(fr);
            String line;
            while((line = br.readLine()) != null){
                int index = 0;
                while((index = line.indexOf("'", index)) != -1){
                    line = line.substring(0, index) + "\\" + line.substring(index);
                    index+=2;
                }
                countriesManager.insertCountry(new Country(line, countriesManager));
            }
        } catch (FileNotFoundException throwables){
            throwables.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
