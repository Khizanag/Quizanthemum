package Controller.Classes.Quiz;

import Tools.Pair;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class Question {

    /* public variables */

    // question types
    public enum Type {
        STANDARD,
        FILL_BLANK,
        MULTI_CHOICE,
        MULTI_ANSWER,
        MULTI_CHOICE_MULTI_ANSWER,
        PICTURE,
        MATCHING
    }

    /* private variables */

    // type of given question
    private Type type;

    // true if question has to be graded automatically, false otherwise
    private boolean autoGraded;

    // maximum score for given question
    private double maxScore;

    // author's comment on question
    private String comment;

    // question source
    private String source;

    /* statements */

    // question header statement as text, instruction.
    // for instance: 'match pictures given below to their definitions'
    private String headerStatement;

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

    // correct answer for STANDARD, PICTURE and MULTI_CHOICE questions
    private String textAnswer;

    // list of answers for FILL_BLANK question
    private List<String> fillBlankAnswers;

    // correct answer for MATCHING questions
    // key is from left options, value is from right options
    private Set<Pair<String>> matchingAnswers;

    // correct answer for MULTI_ANSWER and MULTI_CHOICE_MULTI_ANSWER questions
    private Set<String> multiAnswers;


    /* constructors */

    // default constructor
    public Question(Type type, boolean autoGraded, double maxScore, String headerStatement, String comment, String source) {
        this.type = type;
        this.autoGraded = autoGraded;
        this.maxScore = maxScore;
        this.headerStatement = headerStatement;
        this.comment = comment;
        this.source = source;
    }

    // constructor for standard or picture question
    // for picture question picture url is given as text statement
    public Question(Type type, boolean autoGraded, double maxScore, String headerStatement, String comment, String source,
                    String textStatement, String textAnswer) {
        this(type, autoGraded, maxScore, headerStatement, comment, source);
        this.textStatement = textStatement;
        this.textAnswer = textAnswer;
    }

    // constructor for fill blank question
    public Question(Type type, boolean autoGraded, double maxScore, String headerStatement, String comment, String source,
                    List<String> fillBlankStatements, List<String> fillBlankAnswers) {
        this(type, autoGraded, maxScore, headerStatement, comment, source);
        this.fillBlankStatements = fillBlankStatements;
        this.fillBlankAnswers = fillBlankAnswers;
    }

    // constructor for multiple choice question
    public Question(Type type, boolean autoGraded, double maxScore, String headerStatement, String comment, String source,
                    List<String> multiChoiceStatements, String textAnswer) {
        this(type, autoGraded, maxScore, headerStatement, comment, source);
        this.multiChoiceStatements = multiChoiceStatements;
        this.textAnswer = textAnswer;
    }

    // constructor for multiple answer question
    public Question(Type type, boolean autoGraded, double maxScore, String headerStatement, String comment, String source,
                    String textStatement, Set<String> multiAnswers) {
        this(type, autoGraded, maxScore, headerStatement, comment, source);
        this.textStatement = textStatement;
        this.multiAnswers = multiAnswers;
    }

    // constructor for multiple choice  multiple answer question
    public Question(Type type, boolean autoGraded, double maxScore, String headerStatement, String comment, String source,
                    List<String> multiChoiceStatements, Set<String> multiAnswers) {
        this(type, autoGraded, maxScore, headerStatement, comment, source);
        this.multiChoiceStatements = multiChoiceStatements;
        this.multiAnswers = multiAnswers;
    }

    // constructor for matching question
    public Question(Type type, boolean autoGraded, double maxScore, String headerStatement, String comment, String source,
                    List<String> matchingLeft, List<String> matchingRight, Set<Pair<String>> matchingAnswers) {
        this(type, autoGraded, maxScore, headerStatement, comment, source);

    }

    /* getter and setter methods */

    public Type getType() {
        return type;
    }

    public double getMaxScore() {
        return maxScore;
    }

    public boolean isAutoGraded() {
        return autoGraded;
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

}
