package Controller.Classes.Quiz;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Quiz {

    /* private variables */

    private final String name;
    private final String description;
    private final String iconUrl;         // url for quiz icon
    private final boolean mustShuffleQuestions;
    private final String comment;
    private final String author;          // quiz creator user
    private Date creationDate;
    private List<Question> questions;
    private double maxScore;    // maximum possible score

    /* Quiz constructor for creating Quiz object using database information, about already published quiz */
    public Quiz(String name, String description, String iconUrl, boolean mustShuffleQuestions, String comment,
                String author, Date creationDate, List<Question> questions, int totalScore) {
        this(name, description, iconUrl, mustShuffleQuestions, comment,  author, true);
        this.creationDate = creationDate;
        this.questions = questions;
        this.maxScore = totalScore;
    }

    /*
        Quiz constructor for creating Quiz object initially,
        while this quiz is not still published, and is not saved into database.
         Note: after entirely creating this object, it should be stored into database
     */
    public Quiz(String name, String description, String iconUrl, boolean mustShuffleQuestions, String comment, String author){
        this(name, description, iconUrl, mustShuffleQuestions, comment, author, true);
        this.questions = new ArrayList<>();
        this.maxScore = 0;
    }

    /* helper constructor used by other public constructors */
    private Quiz(String name, String description, String iconUrl, boolean mustShuffleQuestions, String comment, String author, boolean isPrivate){
        this.name = name;
        this.description = description;
        this.iconUrl = iconUrl;
        this.mustShuffleQuestions = mustShuffleQuestions;
        this.comment = comment;
        this.author = author;
    }

    /* getter methods */

    public String getName() { return name; }
    public String getDescription() { return description; }
    public double getMaxScore() { return maxScore; }
    public Date getCreateDate() { return creationDate; }
    public int getQuestionsCount() { return questions.size(); }
    public Question getQuestion(int idx) { return questions.get(idx); }
    public String getAuthor() {  return author; }

    public String getIconUrl() { return iconUrl; }

    /* public methods */

    public void addQuestion(Question question) {
        questions.add(question);
        maxScore += question.getMaxScore();
    }

    public void finishCreatingQuiz() {
        creationDate = new Date();
    }

}
