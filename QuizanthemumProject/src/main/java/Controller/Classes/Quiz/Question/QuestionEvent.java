package Controller.Classes.Quiz.Question;

import Tools.Pair;

import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

public class QuestionEvent {

    /* private variables */

    private int id;
    private final int quizEventId;
    private final Date startDate;       // question start date
    private Date endDate;               // question end date
    private boolean isAlreadyGraded;
    private double userScore;           // user score in this question
    private final Question question;    // question on which given event is connected
    private List<String> userAnswers;


    /* constructor */

    public QuestionEvent(int quizEventId, Question question, boolean isAlreadyGraded, Date startDate) {
        this.quizEventId = quizEventId;
        this.question = question;
        this.isAlreadyGraded = isAlreadyGraded;
        this.startDate = startDate;
        userScore = 0;
    }

    // constructor for database
    public QuestionEvent(int id, int quizEventId, Question question, boolean isAlreadyGraded, Date startDate,
                         Date endDate, double userScore, List<String> userAnswers) {

        this(quizEventId, question, isAlreadyGraded, startDate);
        this.id = id;
        this.endDate = endDate;
        this.userScore = userScore;
        this.userAnswers = userAnswers;
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

    public int getId() { return id; }

    public int getQuizEventId() { return quizEventId; }

    public int getQuestionId() { return question.getID(); }

    public List<String> getUserAnswers() { return userAnswers; }

    /* score computing methods */

    // returns user's score
    // called after question is graded
    public double getUserScore() {
        return userScore;
    }

    public boolean isAutoGraded() { return question.isAutoGraded(); }

    public int getType() { return question.getType(); }

    /*
     * manually set user score.
     * used when question is not automatically graded
     */
    public void setUserScore(double userScore) {
        this.userScore = userScore;
        isAlreadyGraded = true;
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
        isAlreadyGraded = true;
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
        isAlreadyGraded = true;

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
        isAlreadyGraded = true;

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

    public int getNumUsersMultiAnswers() {
        return question.getNumUsersMultiAnswers();
    }

}
