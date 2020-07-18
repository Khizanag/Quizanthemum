package Controller.Classes.Quiz;

import Controller.Classes.Quiz.Quiz;
import Controller.Classes.Users.User;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class QuizEvent {

    /* private variables */

    // quiz that user is taking
    private Quiz quiz;

    // user which is taking quiz
    private User user;

    // quiz starting date
    private Date startDate;

    // quiz status: is it active or already finished
    private boolean isFinished;

    // quiz finishing date
    private Date finishDate;

    // keeps track of current question
    private int questionIdx;

    // keeps filled question events
    private List<QuestionEvent> questionEvents;

    // counts user's total score
    private double userTotalScore;


    /* constructor */

    public QuizEvent(User user, Quiz quiz) {
        this.user = user;
        this.quiz = quiz;
        questionEvents = new ArrayList<QuestionEvent>();
    }


    /* getter and setter methods */

    public double getUserScore() {
        return userTotalScore;
    }

    public Date getFinishDate() {
        return finishDate;
    }

    public User getUser() {
        return user;
    }

    public Date getStartDate() {
        return startDate;
    }

    // TODO
    private boolean isgraded;


    /* public methods */

    // starts quiz
    public void startQuiz() {
        startDate = new Date();
        questionIdx = 0;
        userTotalScore = 0;
    }

    // true if quiz has more questions. false otherwise
    public boolean hasNext() {
        return questionIdx < quiz.getSize();
    }

    // returns current question event to user to fill it
    public QuestionEvent getNextQuestionEvent() {
        QuestionEvent currentQuestionEvent = new QuestionEvent(quiz.getQuestion(questionIdx));
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
        isFinished = true;
        finishDate = new Date();
    }

}
