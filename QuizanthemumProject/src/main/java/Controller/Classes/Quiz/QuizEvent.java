package Controller.Classes.Quiz;


import Controller.Classes.OtherClasses.Challenge;
import Controller.Classes.Quiz.Question.QuestionEvent;
import Controller.Classes.User.User;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static Configs.Config.DEFAULT_ID;


public class QuizEvent {

    /* private variables */

    private int id;
    private final Quiz quiz;                                    // quiz that user is taking
    private final User user;                                    // user which is taking quiz
    private Date startDate;                                     // quiz starting date
    private Date finishDate;                                    // quiz finishing date
    private int questionIdx;                                    // keeps track of current question
    private int questionEventIdx;                               // keeps track of current question event
    private final List<QuestionEvent> questionEvents;           // keeps filled question events
    private double userTotalScore;                              // counts user's total score
    private boolean isPracticeMode;
    private Challenge challenge;

    /* constructor */

    public QuizEvent(User user, Quiz quiz, boolean isPracticeMode, Challenge challenge) {
        this(DEFAULT_ID, user, quiz, null, null, new ArrayList<>(), 0, challenge);
        this.isPracticeMode = isPracticeMode;
    }

    // create from database
    public QuizEvent(int id, User user, Quiz quiz, Date startDate, Date finishDate,
                     List<QuestionEvent> questionEvents, double userTotalScore, Challenge challenge) {
        this.id = id;
        this.quiz = quiz;
        this.user = user;
        this.startDate = startDate;
        this.finishDate = finishDate;
        this.questionEvents = questionEvents;
        this.userTotalScore = userTotalScore;
        this.challenge = challenge;
    }


    /* getter and setter methods */

    public double getUserScore() { return userTotalScore; }

    public Date getFinishDate() { return finishDate; }

    public User getUser() { return user; }

    public Quiz getQuiz() { return quiz; }

    public Date getStartDate() { return startDate; }

    public boolean isPracticeMode() { return isPracticeMode; }

    public Challenge getChallenge(){ return this.challenge; }


    public void setID(int ID){ this.id = ID; }

    public void setChallenge(Challenge challenge){
        this.challenge = challenge;
    }


    /* public methods */

    // starts quiz
    public void startQuiz() {
        startDate = new Date();
        questionIdx = 0;
        userTotalScore = 0;
    }

    // true if quiz has more questions. false otherwise
    public boolean hasNextQuestion() {
        return questionIdx < quiz.getQuestionsCount();
    }

    public void resetQuestionEventIterator() {
        questionEventIdx = 0;
    }

    public boolean hasNextQuestionEvent() {
        return questionEventIdx < questionEvents.size();
    }

    // returns current question event to user to fill it
    public QuestionEvent getNextEmptyQuestionEvent() {
        QuestionEvent currentQuestionEvent = new QuestionEvent(quiz.getQuestion(questionIdx), false, new Date());
        questionIdx += 1;
        return currentQuestionEvent;
    }

    public QuestionEvent getNextFilledQuestionEvent() {
        QuestionEvent currentQuestionEvent = questionEvents.get(questionEventIdx);
        questionEventIdx += 1;
        return currentQuestionEvent;
    }

    // adds already filled question in question events history
    public void setFilledQuestionEvent(QuestionEvent newQuestionEvent) {
        questionEvents.add(newQuestionEvent);
        userTotalScore += newQuestionEvent.getUserScore();
    }

    // sets quiz status as finished
    public void finishQuiz() {
        finishDate = new Date();
    }

    public int getId() {
        return id;
    }

    public void shuffleQuestions() {
        quiz.shuffleQuestions();
    }
}
