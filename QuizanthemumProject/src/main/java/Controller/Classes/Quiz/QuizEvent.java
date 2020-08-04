package Controller.Classes.Quiz;


import Controller.Classes.Quiz.Question.QuestionEvent;
import Controller.Classes.User.User;

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
    private int questionEventIdx;                               // keeps track of current question event
    private final List<QuestionEvent> questionEvents;           // keeps filled question events
    private double userTotalScore;                              // counts user's total score
    private boolean practiceMode;

    /* constructor */

    public QuizEvent(User user, Quiz quiz, boolean isPracticeMode) {
        this.id = -1;
        this.user = user;
        this.quiz = quiz;
        this.questionEvents = new ArrayList<QuestionEvent>();
        this.practiceMode = isPracticeMode;
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

    public boolean isPracticeMode() { return practiceMode; }


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
