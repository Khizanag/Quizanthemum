package Controller.Classes.Quiz;

import Controller.OtherClasses.User;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class QuizEvent {

    /* private variables */

    private final Quiz quiz;                                       // quiz that user is taking
    private final User user;                                      // user which is taking quiz
    private Date startDate;                                      // quiz starting date
    private boolean isFinished;                                 // quiz status: is it active or already finished
    private Date finishDate;                                      // quiz finishing date
    private int questionIdx;                                       // keeps track of current question
    private final List<QuestionEvent> questionEvents; // keeps filled question events
    private double userTotalScore;                          // counts user's total score

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
        QuestionEvent currentQuestionEvent = new QuestionEvent(quiz.getQuestion(questionIdx), new Date());
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
