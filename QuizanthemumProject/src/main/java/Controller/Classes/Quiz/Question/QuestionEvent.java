package Controller.Classes.Quiz.Question;

import Tools.Pair;

import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import static Controller.Classes.Quiz.Question.QuestionTypes.*;

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
        for(int i = 0; i < userAnswers.size(); i++) {
            if(userAnswers.get(i).equals(userAnswers.get(i))) {
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
        int correctAnswersNum = 0;
        int wrongAnswersNum = 0;
        Set<String> realAnswers = question.getMultiAnswers();
        for (String ans : realAnswers) {
            if (userAnswerSet.contains(ans)) {
                correctAnswersNum += 1;
            } else {
                wrongAnswersNum++;
            }
        }
        userScore = question.getMaxScore() * correctAnswersNum / (realAnswers.size() + wrongAnswersNum);
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

        for(Pair<String> a : userMatchingAnswerSet) {
            System.out.println("first: " + a.getFirst());
            System.out.println("second: " + a.getSecond());
        }

        int correctAnswersNum = 0;
        int pairsNum = question.getAnswersCount() / 2;
        System.out.println("num matching: " + pairsNum);

        for(Pair<String> answer : question.getMatchingAnswers()) {
            if (userMatchingAnswerSet.contains(answer)) {
                System.out.println("match f: " + answer.getFirst());
                System.out.println("match s: " + answer.getSecond());
                correctAnswersNum += 1;
            }
        }
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
