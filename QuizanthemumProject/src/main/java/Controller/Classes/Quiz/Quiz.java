package Controller.Classes.Quiz;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Quiz {

    /* private variables */

    // quiz owner user
    private String author;

    // quiz creation date
    private Date createDate;

    // quiz name
    private String name;

    // url for quiz icon
    private String iconUrl;

    // quiz description
    private String description;

    // list of questions in quiz
    private List<Question> questions;

    // maximum possible score
    private double maxScore = 0;


    /* constructor */

    public Quiz(String author) {
        this.author = author;
        questions = new ArrayList<>();
    }


    /* getter and setter methods */

    public String getAuthor() {
        return author;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIconUrl() {
        return iconUrl;
    }

    public void setIconUrl(String iconUrl) {
        this.iconUrl = iconUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getMaxScore() {
        return maxScore;
    }


    /* public methods */

    public void addQuestion(Question question) {
        questions.add(question);
        maxScore += question.getMaxScore();
    }

    // saves create date
    public void finishCreatingQuiz() {
        createDate = new Date();
    }

    // returns number of questions in quiz
    public int getSize() {
        return questions.size();
    }

    // returns question on given index
    public Question getQuestion(int idx) {
        return questions.get(idx);
    }
}
