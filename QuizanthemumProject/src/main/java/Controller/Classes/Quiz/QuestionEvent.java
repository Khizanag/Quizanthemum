package Controller.Classes.Quiz;

import Tools.Pair;

import java.util.Set;

public class QuestionEvent {

    /* private variables */

    // user score in this question
    private double userScore;

    // question on which given event is connected
    private Question question;

    // correct answer for STANDARD, FILL_BLANK, PICTURE and MULTI_CHOICE questions
    private String userTextAnswer;

    // correct answer for MATCHING questions
    private Set<Pair<String>> userMatchingAnswers;

    // correct answer for MULTI_ANSWER and MULTI_CHOICE_MULTI_ANSWER questions
    private Set<String> userMultiAnswers;

    /* getter and setter methods */

    public QuestionEvent(Question question) {
        this.question = question;
        userScore = 0;
    }

    public void setUserTextAnswer(String userTextAnswer) {
        this.userTextAnswer = userTextAnswer;
    }

    public void setUserMatchingAnswer(Set<Pair<String>> userMatchingAnswer) {
        this.userMatchingAnswers = userMatchingAnswer;
    }

    public void setUserMultiAnswer(Set<String> userMultiAnswer) {
        this.userMultiAnswers = userMultiAnswer;
    }


    /* score computing methods */

    public double getUserScore() {
        return userScore;
    }

    /*
    manually set user score.
    used when question is not automatically graded
     */
    public void setUserScore(double userScore) {
        this.userScore = userScore;
    }

    /*
    compares user's answer with real answer and grades.
    correct answer is graded as maximum score.
    incorrect answer is graded as 0.
     */
    public void gradeTextAnswer() {
        if(userTextAnswer.equals(question.getTextAnswer())) {
            userScore = question.getMaxScore();
        }
    }

    /*
    compares user's answers with real ones and grades.
    score depends on number of correct answers.
     */
    public void gradeMultiAnswer() {
        int correctAnswersNum = 0;
        for(String answer : question.getMultiAnswers()) {
            if (userMultiAnswers.contains(answer)) {
                correctAnswersNum += 1;
            }
        }
        userScore = question.getMaxScore() * correctAnswersNum / question.getMultiAnswersNum();
    }

    /*
    compares user's matching pairs with real ones and grades.
    score depends on number of correct matches.
     */
    public void gradeMatchingAnswer() {
        int correctAnswersNum = 0;
        for(Pair<String> answer : question.getMatchingAnswers()) {
            if (userMatchingAnswers.contains(answer)) {
                correctAnswersNum += 1;
            }
        }
        userScore = question.getMaxScore() * correctAnswersNum / question.getMultiAnswersNum();
    }

}
