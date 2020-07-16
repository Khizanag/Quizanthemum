package Controller.Classes.Quiz;

import Tools.StringPair;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class Question {

    private static final String STANDARD = "StandardQuestion";
    private static final String FILL_BLANK = "FillBlankQuestion";
    private static final String MULTI_CHOICE = "MultiChoiceQuestion";
    private static final String MULTI_ANSWER = "MultiAnswerQuestion";
    private static final String MULTI_CHOICE_MULTI_ANSWER = "MultiChoiceMultiAnswerQuestion";
    private static final String PICTURE = "PictureQuestion";

    private final String type;
    private String statement;
    private int maxScore;
    private int score;

    private String textAnswer;
    private String correctTextAnswer;

    private Set<StringPair> matchingAnswer;
    private Set<StringPair> correctMatchingAnswer;

    private Set<String> multiAnswer;
    private Set<String> correctMultiAnswer;

    public Question(String type) {
        this.type = type;
    }

    /*
     * returns all possible question types
     */
    public static List<String> getQuestionTypes() {
        List<String> types = new ArrayList<String>();
        types.add(STANDARD);
        types.add(FILL_BLANK);
        types.add(MULTI_CHOICE);
        types.add(MULTI_ANSWER);
        types.add(PICTURE);
        // TODO add more types
        return types;
    }

    public String getType() {
        return type;
    }

    public void setStatement(String statement) {
        this.statement = statement;
    }

    public String getStatement() {
        return statement;
    }

    public boolean checkAnswer() {
        return correctTextAnswer.equals(textAnswer);
    }

    public void setTextAnswer(String answer) {
        this.textAnswer = answer;
    }

    public void setCorrectTextAnswer(String correctTextAnswer) {
        this.correctTextAnswer = correctTextAnswer;
    }

    public int getMaxScore() {
        return maxScore;
    }

    public void setMaxScore(int maxScore) {
        this.maxScore = maxScore;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }
}
