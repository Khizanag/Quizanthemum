package Controller.Classes.OtherClasses;

import Configs.CategoriesTableConfig;

import static Configs.Config.DEFAULT_ID;

public class Category {

    private int ID;
    private String name;

    // To use at the first creating time of category, before it is not added into database
    public Category(String name){
        this.ID = DEFAULT_ID;
        this.name = name;
    }

    public Category(int ID, String name){
        this.ID = ID;
        this.name = name;
    }

    /* GETTER methods */

    public int getID(){ return this.ID; }

    public String getName(){ return this.name; }
}
