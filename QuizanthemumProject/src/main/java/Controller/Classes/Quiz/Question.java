package Controller.Classes.Quiz;

import Tools.Pair;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

public class Question {

    /* private variables */

    // question id
    private final int ID;

    // type of given question
    private final int type;

    // true if question has to be graded automatically, false otherwise
    private final boolean isAutoGraded;

    // maximum score for given question
    private final double maxScore;

    // author's comment on question
    private final String comment;

    // question source
    private final String source;

    // creation date
    private final Date creationDate;

    // owner quiz
    private final Quiz quiz;

    /* statements */

    private boolean isPictureQuestion;

    // question header statement as text, instruction.
    // for instance: 'match pictures given below to their definitions'
    private final String headerStatement;

    // question statement as text
    private String textStatement;

    // multiple choice statement
    private List<String> multiChoiceStatements;

    // list of statements for FILL_BLANK question
    // text fields are going to appear between them
    private List<String> fillBlankStatements;

    // matching options left
    // size should be equal to matchingRight size
    private List<String> matchingLeft;

    // matching options right
    // size should be equal to matchingLeft size
    private List<String> matchingRight;

    /* answers */

    // if user can see pictures in the mulitple answers
    private boolean isPictureAnswer;

    // correct answer for STANDARD, PICTURE and MULTI_CHOICE questions
    private String textAnswer;

    // list of answers for FILL_BLANK question
    private List<String> fillBlankAnswers;

    // correct answer for MATCHING questions
    // key is from left options, value is from right options
    private Set<Pair<String>> matchingAnswers;

    // correct answer for MULTI_ANSWER and MULTI_CHOICE_MULTI_ANSWER questions
    private Set<String> multiAnswers;

    // TODO change hashset -> treeset

    /* constructors */

    // default constructor
    private Question(int ID, int type, boolean isAutoGraded, double maxScore,
                     String headerStatement, String comment, String source, Quiz quiz, Date creationDate) {
        this.ID = ID;
        this.type = type;
        this.isAutoGraded = isAutoGraded;
        this.maxScore = maxScore;
        this.headerStatement = headerStatement;
        this.comment = comment;
        this.source = source;
        this.quiz = quiz;
        this.creationDate = creationDate;
        this.isPictureQuestion = false;
        this.isPictureAnswer = false;
    }

    // constructor for STANDARD question
    // for picture question picture url is given as text statement
    public Question(int ID, int type, boolean isAutoGraded, double maxScore,
                    boolean isPictureQuestion, String headerStatement, String comment,
                    String source, Date creationDate, Quiz quiz, String textStatement, String textAnswer) {
        this(ID, type, isAutoGraded, maxScore, headerStatement, comment, source, quiz, creationDate);
        this.textStatement = textStatement;
        this.textAnswer = textAnswer;
        this.isPictureQuestion = isPictureQuestion;
    }

    // constructor for FILL_BLANK question
    public Question(int ID, int type, boolean isAutoGraded, double maxScore,
                    String headerStatement, String comment, String source, Date creationDate,
                    Quiz quiz, List<String> fillBlankStatements, List<String> fillBlankAnswers) {
        this(ID, type, isAutoGraded, maxScore, headerStatement, comment, source, quiz, creationDate);
        this.fillBlankStatements = fillBlankStatements;
        this.fillBlankAnswers = fillBlankAnswers;
    }

    // constructor for MULTIPLE_CHOICE question
    public Question(int ID, int type, boolean isAutoGraded, double maxScore,
                    boolean isPictureQuestion, String headerStatement, String comment,
                    String source, Date creationDate, Quiz quiz, List<String> multiChoiceStatements,
                    boolean isPictureAnswer, String textAnswer) {
        this(ID, type, isAutoGraded, maxScore, headerStatement, comment, source, quiz, creationDate);
        this.multiChoiceStatements = multiChoiceStatements;
        this.textAnswer = textAnswer;
        this.isPictureQuestion = isPictureQuestion;
        this.isPictureAnswer = isPictureAnswer;
    }

    // constructor for MULTIPLE_ANSWER question
    public Question(int ID, int type, boolean isAutoGraded, double maxScore,
                    boolean isPictureQuestion, String headerStatement, String comment, String source,
                    Date creationDate, Quiz quiz, String textStatement, Set<String> multiAnswers) {
        this(ID, type, isAutoGraded, maxScore, headerStatement, comment, source, quiz, creationDate);
        this.textStatement = textStatement;
        this.multiAnswers = multiAnswers;
        this.isPictureQuestion = isPictureQuestion;
    }

    // constructor for MULTIPLE_CHOICE_MULTIPLE_ANSWER question
    public Question(int ID, int type, boolean isAutoGraded, double maxScore, boolean isPictureQuestion,
                    String headerStatement, String comment, String source,
                    Date creationDate, Quiz quiz, List<String> multiChoiceStatements,
                    boolean isPictureAnswer, Set<String> multiAnswers) {
        this(ID, type, isAutoGraded, maxScore, headerStatement, comment, source, quiz, creationDate);
        this.multiChoiceStatements = multiChoiceStatements;
        this.multiAnswers = multiAnswers;
        this.isPictureQuestion = isPictureQuestion;
        this.isPictureAnswer = isPictureAnswer;
    }

    // constructor for MATCHING question
    // TODO make pictures in matchings
    public Question(int ID, int type, boolean isAutoGraded, double maxScore,
                    String headerStatement, String comment, String source,
                    Date creationDate, Quiz quiz, List<String> matchingLeft,
                    List<String> matchingRight, Set<Pair<String>> matchingAnswers) {
        this(ID, type, isAutoGraded, maxScore, headerStatement, comment, source, quiz, creationDate);
        this.matchingLeft = matchingLeft;
        this.matchingRight = matchingRight;
        this.matchingAnswers = matchingAnswers;
    }

    /* getter and setter methods */

    public int getType() {
        return type;
    }

    public double getMaxScore() {
        return maxScore;
    }

    public boolean isAutoGraded() {
        return isAutoGraded;
    }

    public String getHeaderStatement() {
        return headerStatement;
    }

    public String getTextStatement() {
        return textStatement;
    }

    public List<String> getMultiChoiceStatements() {
        return multiChoiceStatements;
    }

    public int getMultiAnswersNum() {
        return multiAnswers.size();
    }

    public List<String> getMatchingLeft() {
        return matchingLeft;
    }

    public List<String> getMatchingRight() {
        return matchingRight;
    }

    public String getTextAnswer() {
        return textAnswer;
    }

    public Set<Pair<String>> getMatchingAnswers() {
        return matchingAnswers;
    }

    public Set<String> getMultiAnswers() {
        return multiAnswers;
    }

    public String getComment() {
        return comment;
    }

    public String getSource() {
        return source;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public Quiz getQuiz() {
        return quiz;
    }

    public List<String> getFillBlankStatements() {
        return fillBlankStatements;
    }

    public List<String> getFillBlankAnswers() {
        return fillBlankAnswers;
    }

    public boolean isPictureQuestion() {
        return isPictureQuestion;
    }

    public boolean isPictureAnswer() {
        return isPictureAnswer;
    }

}
