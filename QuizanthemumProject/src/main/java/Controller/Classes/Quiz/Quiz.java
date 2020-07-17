package Controller.Classes.Quiz;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Quiz {
    private String author;
    private Date createDate;
    private String name;
    private String iconUrl;
    private List<Question> questions;
    private double maxScore = 0;

    public Quiz(String author, String name, String iconUrl, Date createDate) {
        this.author = author;
        this.createDate = createDate;
        this.name = name;
        this.iconUrl = iconUrl;
        questions = new ArrayList<>();
    }

    public void addQuestion(Question question) {
        questions.add(question);
        maxScore += question.getMaxScore();
    }

    public int getSize() {
        return questions.size();
    }

    public Question getQuestion(int idx) {
        return questions.get(idx);
    }

    /*
    returns maximum possible score for given quiz
     */
    public double getMaxScore() {
        return maxScore;
    }
}
