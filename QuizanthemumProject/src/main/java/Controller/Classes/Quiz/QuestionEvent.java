package Controller.Classes.Quiz;

import Tools.Pair;

import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

public class QuestionEvent {

    /* private variables */

//    private final int id; // TODO vin madzlevs am id-s?
    private final Date startDate;       // question start date
    private Date endDate;               // question end date
    private boolean isAlreadyGraded;
    private double userScore;           // user score in this question
    private final Question question;    // question on which given event is connected
    private List<String> userAnswers;


    /* constructor */

    public QuestionEvent(Question question, boolean isAlreadyGraded, Date startDate) {
        this.question = question;
        this.isAlreadyGraded = isAlreadyGraded;
        this.startDate = startDate;
        userScore = 0;
    }

    /* public methods */

    // finishes question event
    public void finishQuestionEvent(){
        endDate = new Date();
    }


    /* getter and setter methods */

    public void setUserAnswers(List<String> userAnswers) {
        this.userAnswers = userAnswers;
    }


    /* score computing methods */

    // returns user's score
    // called after question is graded
    public double getUserScore() {
        return userScore;
    }

    /*
     * manually set user score.
     * used when question is not automatically graded
     */
    public void setUserScore(double userScore) {
        this.userScore = userScore;
    }

    /*
     * compares user's answer with real answer and grades.
     * correct answer is graded as maximum score.
     * incorrect answer is graded as 0.
     */
    public void autoGradeTextAnswer() {
        if(userAnswers.get(0).equals(question.getTextAnswer())) {
            userScore = question.getMaxScore();
        }
    }

    /*
     * compares user's answers with real ones and grades.
     * score depends on number of correct answers.
     */
    public void autoGradeMultiAnswer() {
        Set<String> userAnswerSet = new TreeSet<>();
        for (int i = 0; i < question.getAnswersCount(); i++) {
            userAnswerSet.add(userAnswers.get(i));
        }
        int correctAnswersNum = 0;
        for (String ans : question.getMultiAnswers()) {
            if (userAnswerSet.contains(ans)) {
                correctAnswersNum += 1;
            }
        }
        userScore = question.getMaxScore() * correctAnswersNum / question.getStatementsCount();
    }

    /*
     * compares user's matching pairs with real ones and grades.
     * score depends on number of correct matches.
     */
    public void autoGradeMatchingAnswer() {
        Set<Pair<String>> userMatchingAnswerSet = new TreeSet<>();
        for (int i = 0; i < question.getAnswersCount(); i+=2) {
            userMatchingAnswerSet.add(new Pair<>(userAnswers.get(i), userAnswers.get(i+1)));
        }
        int correctAnswersNum = 0;
        int pairsNum = question.getAnswersCount() / 2;
        for(Pair<String> answer : question.getMatchingAnswers()) {
            if (userMatchingAnswerSet.contains(answer)) {
                correctAnswersNum += 1;
            }
        }
        userScore = question.getMaxScore() * correctAnswersNum / pairsNum;
    }

    public Date getEndDate() {
        return endDate;
    }

    public Date getStartDate() {
        return startDate;
    }

    public boolean isAlreadyGraded() {
        return isAlreadyGraded;
    }
}
