package Controller.Classes.Quiz;


import Controller.Classes.OtherClasses.User;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class QuizEvent {

    /* private variables */

    private final int id;
    private final Quiz quiz;                                    // quiz that user is taking
    private final User user;                                    // user which is taking quiz
    private Date startDate;                                     // quiz starting date
    private Date finishDate;                                    // quiz finishing date
    private int questionIdx;                                    // keeps track of current question
    private final List<QuestionEvent> questionEvents;           // keeps filled question events
    private double userTotalScore;                              // counts user's total score

    /* constructor */

    public QuizEvent(int id, User user, Quiz quiz) {
        this.id = id;
        this.user = user;
        this.quiz = quiz;
        questionEvents = new ArrayList<QuestionEvent>();
    }

    // create from database
    public QuizEvent(int id, User user, Quiz quiz, Date startDate, Date finishDate,
                     List<QuestionEvent> questionEvents, double userTotalScore) {
        this.id = id;
        this.user = user;
        this.quiz = quiz;
        this.startDate = startDate;
        this.finishDate = finishDate;
        this.questionEvents = questionEvents;
        this.userTotalScore = userTotalScore;
    }


    /* getter and setter methods */

    public double getUserScore() { return userTotalScore; }

    public Date getFinishDate() { return finishDate; }

    public User getUser() { return user; }

    public Quiz getQuiz() { return quiz; }

    public Date getStartDate() { return startDate; }


    /* public methods */

    // starts quiz
    public void startQuiz() {
        startDate = new Date();
        questionIdx = 0;
        userTotalScore = 0;
    }

    // true if quiz has more questions. false otherwise
    public boolean hasNext() {
        return questionIdx < quiz.getQuestionsCount();
    }

    // returns current question event to user to fill it
    public QuestionEvent getNextQuestionEvent() {
        QuestionEvent currentQuestionEvent = new QuestionEvent(id, quiz.getQuestion(questionIdx), false, new Date());
        questionIdx += 1;
        return currentQuestionEvent;
    }

    // adds already filled question in question events history
    public void setFilledQuestionEvent(QuestionEvent qe) {
        questionEvents.add(qe);
        userTotalScore += qe.getUserScore();
    }

    // sets quiz status as finished
    public void finishQuiz() {
        finishDate = new Date();
    }

    public int getId() {
        return id;
    }

    // TODO modify. grading...
}
