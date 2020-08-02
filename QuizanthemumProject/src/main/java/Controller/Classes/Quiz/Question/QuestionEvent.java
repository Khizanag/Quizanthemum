package Controller.Classes.Quiz.Question;

import Tools.Pair;

import java.util.*;

import static Controller.Classes.Quiz.Question.QuestionTypes.*;
import static java.lang.Integer.max;

public class QuestionEvent {

    /* private variables */

    private int id;
    private int quizEventId;
    private final Date startDate;       // question start date
    private Date endDate;               // question end date
    private boolean isAlreadyGraded;
    private double userScore;           // user score in this question
    private final Question question;    // question on which given event is connected
    private List<String> userAnswers;


    /* constructor */

    public QuestionEvent(Question question, boolean isAlreadyGraded, Date startDate) {
        this.quizEventId = -1; // valid value will be set after quiz event insertion in database
        this.question = question;
        this.isAlreadyGraded = isAlreadyGraded;
        this.startDate = startDate;
        userScore = 0;
    }

    // constructor for database
    public QuestionEvent(int id, int quizEventId, Question question, boolean isAlreadyGraded, Date startDate,
                         Date endDate, double userScore, List<String> userAnswers) {

        this(question, isAlreadyGraded, startDate);
        this.id = id;
        this.quizEventId = quizEventId;
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

    public Question getQuestion() { return question; }

    public List<String> getUserAnswers() { return userAnswers; }

    /* score computing methods */

        // TODO with num statements
    // returns user's score
    // called after question is graded
    public double getUserScore() {
        return userScore;
    }

    public boolean isAutoGraded() { return question.isAutoGraded(); }

    public int getType() {
        int type = question.getType();
        return  type;
    }

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

    public void autoGradeFillBlank() {
        int correctAnswersNum = 0;
        List<String> realAnswers = question.getAnswers();
        for(int i = 0; i < userAnswers.size(); i++) {
            if(userAnswers.get(i).equals(realAnswers.get(i))) {
                correctAnswersNum++;
            }
        }
        isAlreadyGraded = true;
        userScore = question.getMaxScore() * correctAnswersNum / question.getStatementsCount();

    }

    /*
     * compares user's answers with real ones and grades.
     * score depends on number of correct answers.
     */
    public void autoGradeMultiAnswer() {
        Set<String> userAnswerSet = new TreeSet<>();

        for (int i = 0; i < userAnswers.size(); i++) {
            userAnswerSet.add(userAnswers.get(i));
        }
        int userCorrectAnswers = 0;
        Set<String> realAnswers = question.getMultiAnswers();
        for (String ans : realAnswers) {
            if (userAnswerSet.contains(ans)) {
                userCorrectAnswers++;
            }
        }
        int userWrongAnswers = userAnswers.size() - userCorrectAnswers;
        int userAnswersBalance = userCorrectAnswers - userWrongAnswers;

        userScore = question.getMaxScore() * max(0, userAnswersBalance) / (realAnswers.size());
        isAlreadyGraded = true;

    }

    /*
     * compares user's matching pairs with real ones and grades.
     * score depends on number of correct matches.
     */
    public void autoGradeMatchingAnswer() {
        Set<Pair<String>> userMatchingAnswerSet = new TreeSet<>();
        System.out.println("user size: " + userAnswers.size());
        System.out.println("real size: " + question.getAnswersCount());
        for (int i = 0; i < userAnswers.size(); i+=2) {
            userMatchingAnswerSet.add(new Pair<>(userAnswers.get(i), userAnswers.get(i+1)));
        }

        int correctAnswersNum = 0;
        int pairsNum = question.getAnswersCount() / 2;

        for(Pair<String> answer : question.getMatchingAnswers()) {
            for(Pair<String> userAnswer : userMatchingAnswerSet) {
                if(answer.equals(userAnswer)) {
                    correctAnswersNum++;
                }
            }
        }
        System.out.println("correct answers: " + correctAnswersNum + " from " + pairsNum);
        userScore = question.getMaxScore() * correctAnswersNum / pairsNum;
        isAlreadyGraded = true;

    }

    public void setQuizEventId (int quizEventId) {
        this.quizEventId = quizEventId;
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

    public int getNumUsersAnswers() {
        if(question.getType() == STANDARD) {
            return 1;
        } else if (question.getType() == FILL_BLANK){
            return question.getAnswersCount();
        } else {
            return question.getStatementsCount();
        }
    }

}
