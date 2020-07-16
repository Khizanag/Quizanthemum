package Controller.Classes.Quiz;

import Tools.StringPair;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class Question {

    private final String type;
    private String statement;
    private int maxScore;
    private int score;

    private String textAnswer;
    private String correctTextAnswer;

    private Set<StringPair> matchingAnswer;
    private Set<StringPair> correctMatchingAnswer;

    public Question(String type) {
        this.type = type;
    }


    /*
     * returns all possible question types
     */
    public static List<String> getQuestionTypes() {
        List<String> types = new ArrayList<String>();
        types.add("StandardQuestion");
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
