package Controller.Classes.Quiz;

import Controller.Classes.OtherClasses.Category;
import Controller.Classes.Quiz.Question.Question;
import Controller.Classes.User.User;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import static Configs.Config.DEFAULT_ID;

public class Quiz {

    /* private instance variables */

    private int id;
    private final String name;
    private final Category category;
    private final String description;
    private final String iconUrl;                           // url for quiz icon
    private final boolean mustShuffleQuestions;
    private final String comment;
    private final User author;                            // quiz creator user
    private Date creationDate;
    private List<Question> questions;
    private double maxScore;                            // maximum possible score

    /* Quiz constructor for creating Quiz object using database information, about already published quiz */
    public Quiz(int id, String name, Category category, String description, String iconUrl, boolean mustShuffleQuestions,
                String comment, User author, Date creationDate, List<Question> questions, double maxScore) {
        this(id, name, category, description, iconUrl, mustShuffleQuestions, comment,  author);
        this.creationDate = creationDate;
        this.questions = questions;
        this.maxScore = maxScore;
    }

    /*
        Quiz constructor for creating Quiz object initially,
        while this quiz is not still published, and is not saved into database.
        Note: after entirely creating this object, it should be stored into database
     */
    public Quiz(String name, Category category, String description, String iconUrl,
                boolean mustShuffleQuestions, String comment, User author) {
        this(DEFAULT_ID, name, category, description, iconUrl, mustShuffleQuestions, comment, author);
        this.questions = new ArrayList<>();
        this.maxScore = 0;
        this.creationDate = new Date();
    }

    /* helper constructor used by other public constructors */
    private Quiz(int id, String name, Category category, String description, String iconUrl,
                 boolean mustShuffleQuestions, String comment, User author){
        this.id = id;
        this.name = name;
        this.category = category;
        this.description = description;
        this.iconUrl = iconUrl;
        this.mustShuffleQuestions = mustShuffleQuestions;
        this.comment = comment;
        this.author = author;
    }

    /* getter methods */
    public int getID() { return this.id; }

    public String getName() { return this.name; }

    public Category getCategory(){ return this.category; }

    public String getDescription() { return this.description; }

    public String getIconUrl(){ return iconUrl; }

    public boolean mustShuffleQuestions(){ return mustShuffleQuestions; }

    public String getComment(){ return comment; }

    public double getMaxScore() { return maxScore; }

    public Date getCreationDate() { return creationDate; }

    public int getQuestionsCount() { return questions.size(); }

    public Question getQuestion(int idx) { return questions.get(idx); }

    public User getAuthor() {  return author; }

    /* SETTERS */
    public void setID(int ID){
        this.id = ID;
    }

    /* public methods */

    public void addQuestion(Question question) {
        if(questions == null)
            questions = new ArrayList<>();
        questions.add(question);
        maxScore += question.getMaxScore();
    }

    public void finishCreatingQuiz() {
        creationDate = new Date();
    }

    public void shuffleQuestions() {
        Collections.shuffle(questions);
    }

}
