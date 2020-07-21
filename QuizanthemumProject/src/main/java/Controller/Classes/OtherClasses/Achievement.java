package Controller.Classes.OtherClasses;

public final class Achievement {

    private final int id;
    private final String title;
    private final String description;
    private final String iconURL;

    public Achievement(int id, String title, String description, String iconURL){
        this.id = id;
        this.title = title;
        this.description = description;
        this.iconURL = iconURL;
    }

    public int getId() { return id; }

    public String getTitle() { return title; }

    public String getDescription() { return description; }

    public String getIconURL() { return iconURL; }
}
