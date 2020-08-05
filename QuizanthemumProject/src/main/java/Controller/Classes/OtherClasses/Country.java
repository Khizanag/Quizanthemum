package Controller.Classes.OtherClasses;

import static Configs.Config.DEFAULT_ID;

public class Country {

    private int ID;
    private final String name;

    private final CountriesManager manager;

    public Country(int ID, String name, CountriesManager manager){
        this.ID = ID;
        this.name = name;
    }

    public Country(String name, CountriesManager manager){
        this(DEFAULT_ID, name, manager);
    }

    public int getID() { return ID; }

    public String getName() { return name; }

    public CountriesManager getManager() { return manager; }

    public void setID(int ID) { this.ID = ID; }


}
