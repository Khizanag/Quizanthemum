package Controller.Classes.Quiz.Question;

import Tools.Pair;

import java.util.*;

public final class Question {

    /* private variables */

    private int ID;
    private final int type;
    private final boolean isAutoGraded;   // true if question has to be graded automatically, false otherwise
    private final double maxScore;         // maximum score for given question
    private final String comment;           // author's comment on question
    private final String source;               // question source. link, book...
    private final Date creationDate;
    private int quizID;                            // question owner quiz

    /* statements */

    private final boolean isPictureQuestion;       // question statement is given as picture
    private final String headerStatement;          // question header statement as text, instruction.
    private final String textStatement;            // question header statement as text, instruction.
    private final String pictureStatementURL;      // question header statement as text, instruction.
    private final List<String> statements;         // statement for all type of questions

    /* answers */

    private final boolean isPictureAnswer;         // if user can see pictures in possible answers
    private final List<String> answers;            // list of answers for all type of questions

    /* constructor */

    public Question(int type, boolean isAutoGraded, double maxScore, String headerStatement, String comment,
                    String source, Date creationDate, int quizID, boolean isPictureQuestion, boolean isPictureAnswer,
                    String textStatement, String pictureStatementURL, List<String> statements, List<String> answers) {
        this.type = type;
        this.isAutoGraded = isAutoGraded;
        this.maxScore = maxScore;
        this.headerStatement = headerStatement;
        this.comment = comment;
        this.source = source;
        this.quizID = quizID;
        this.creationDate = creationDate;
        this.isPictureQuestion = isPictureQuestion;
        this.isPictureAnswer = isPictureAnswer;
        this.textStatement = textStatement;
        this.pictureStatementURL = pictureStatementURL;
        this.statements = statements;
        this.answers = answers;
    }

    // constructor for database (id is added)
    public Question(int ID, int type, boolean isAutoGraded, double maxScore, String headerStatement, String comment,
                    String source, Date creationDate, int quizId, boolean isPictureQuestion, boolean isPictureAnswer,
                    String textStatement, String pictureStatementURL, List<String> statements, List<String> answers) {

        this(type, isAutoGraded, maxScore, headerStatement, comment, source, creationDate, quizId, isPictureQuestion,
                isPictureAnswer, textStatement, pictureStatementURL, statements, answers);
        this.ID = ID;
    }



    /* getter methods */

    public int getID() { return ID; }

    public int getType() { return type; }

    public double getMaxScore() { return maxScore; }

    public boolean isAutoGraded() { return isAutoGraded; }

    public String getHeaderStatement() { return headerStatement; }

    public String getComment() { return comment; }

    public String getSource() { return source; }

    public Date getCreationDate() { return creationDate; }

    public int getQuizID() { return quizID; }

    public boolean isPictureQuestion() { return isPictureQuestion; }

    public boolean isPictureAnswer() { return isPictureAnswer; }

    /* SETTERS */
    public void setID(int ID){
        this.ID = ID;
    }
    public void setQuizID(int quizID){ this.quizID = quizID; }

    /* statement getters */

    public int getStatementsCount() { return statements.size(); }

    public String getTextStatement() { return textStatement; }

    public String getPictureStatementURL() { return pictureStatementURL; }

    // for multi-choice and fill-blank questions
    public List<String> getStatements() { return statements; }

    // returns left side of matching statement
    public List<String> getMatchingLeft() {
        List<String> leftMatching = new ArrayList<>();
        for (int i = 0; i < statements.size(); i+=2) {
            leftMatching.add(statements.get(i));
        }
        Collections.shuffle(leftMatching);
        return leftMatching;
    }

    // returns left side of matching statement
    public List<String> getMatchingRight() {
        List<String> rightMatching = new ArrayList<>();
        for (int i = 1; i < statements.size(); i+=2) {
            rightMatching.add(statements.get(i));
        }
        Collections.shuffle(rightMatching);
        return rightMatching;
    }

    /* answer getters */

    public int getAnswersCount() { return answers.size(); }

    public String getTextAnswer() { return answers.get(0); }

    public List<String> getAnswers() { return answers; }

    public Set<Pair<String>> getMatchingAnswers() {
        Set<Pair<String>> matchingAnswers = new TreeSet<>();
        for (int i = 0; i < statements.size(); i+=2) {
            matchingAnswers.add(new Pair<>(answers.get(i), answers.get(i+1)));
        }
        return matchingAnswers;
    }

    // for multi-choice and fill-blank questions
    public Set<String> getMultiAnswers() {
        Set<String> multiAnswers = new TreeSet<>();
        for (int i = 0; i < statements.size(); i++) {
            multiAnswers.add(answers.get(i));
        }
        return multiAnswers;
    }

}
