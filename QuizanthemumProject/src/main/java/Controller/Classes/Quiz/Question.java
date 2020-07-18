package Controller.Classes.Quiz;

import Tools.Pair;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class Question {

    /* public variables */

    // question types
    public enum Type {
        STANDARD,
        FILL_BLANK,
        MULTI_CHOICE,
        MULTI_ANSWER,
        MULTI_CHOICE_MULTI_ANSWER,
        PICTURE,
        MATCHING
    }

    /* private variables */

    // type of given question
    private Type type;

    // true if question has to be graded automatically, false otherwise
    private boolean autoGraded;

    // maximum score for given question
    private double maxScore;

    // question header statement as text, instruction.
    // for instance: 'match pictures given below to their definitions'
    private String headerStatement;

    // question statement as text
    private String textStatement;

    // multiple choice statement
    private List<String> multiChoiceStatement;

    // multiple answers number
    private int multiAnswersNum;

    // picture statement
    private String pictureURL;

    // matching options left
    private List<String> matchingLeft;

    // matching options right
    private List<String> matchingRight;

    // correct answer for STANDARD, FILL_BLANK, PICTURE and MULTI_CHOICE questions
    private String textAnswer;

    // correct answer for MATCHING questions
    // key is from left options, value is from right options
    private Set<Pair<String>> matchingAnswers;

    // correct answer for MULTI_ANSWER and MULTI_CHOICE_MULTI_ANSWER questions
    private Set<String> multiAnswers;


    /* constructor */

    public Question(Type type) {
        this.type = type;
    }


    /* getter and setter methods */

    public Type getType() {
        return type;
    }

    public double getMaxScore() {
        return maxScore;
    }

    public void setMaxScore(int maxScore) {
        this.maxScore = maxScore;
    }

    public boolean isAutoGraded() {
        return autoGraded;
    }

    public void setAutoGraded(boolean autoGraded) {
        this.autoGraded = autoGraded;
    }

    public String getHeaderStatement() {
        return headerStatement;
    }

    public void setHeaderStatement(String headerStatement) {
        this.headerStatement = headerStatement;
    }

    public String getTextStatement() {
        return textStatement;
    }

    public void setTextStatement(String textStatement) {
        this.textStatement = textStatement;
    }

    public List<String> getMultiChoiceStatement() {
        return multiChoiceStatement;
    }

    public void setMultiChoiceStatement(List<String> multiChoiceStatement) {
        this.multiChoiceStatement = multiChoiceStatement;
    }

    public int getMultiAnswersNum() {
        return multiAnswersNum;
    }

    public void setMultiAnswersNum(int multiAnswersNum) {
        this.multiAnswersNum = multiAnswersNum;
    }

    public String getPictureURL() {
        return pictureURL;
    }

    public void setPictureURL(String pictureURL) {
        this.pictureURL = pictureURL;
    }

    public List<String> getMatchingLeft() {
        return matchingLeft;
    }

    public void setMatchingLeft(List<String> matchingLeft) {
        this.matchingLeft = matchingLeft;
    }

    public List<String> getMatchingRight() {
        return matchingRight;
    }

    public void setMatchingRight(List<String> matchingRight) {
        this.matchingRight = matchingRight;
    }

    public String getTextAnswer() {
        return textAnswer;
    }

    public void setTextAnswer(String textAnswer) {
        this.textAnswer = textAnswer;
    }

    public Set<Pair<String>> getMatchingAnswers() {
        return matchingAnswers;
    }

    public void setMatchingAnswers(Set<Pair<String>> matchingAnswers) {
        this.matchingAnswers = matchingAnswers;
    }

    public Set<String> getMultiAnswers() {
        return multiAnswers;
    }

    public void setMultiAnswers(Set<String> multiAnswers) {
        this.multiAnswers = multiAnswers;
    }

}
