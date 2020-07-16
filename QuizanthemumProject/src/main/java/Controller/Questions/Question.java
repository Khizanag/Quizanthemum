package Controller.Questions;

import java.util.HashSet;
import java.util.Set;

public abstract class Question {
    private String type;
    private String statement;
    private String textAnswer;
    private String multipleChoiceResponse;
    private String correctAnswer;

    public Question(String type) {
        this.type = type;
    }


    /*
     * returns all possible question types
     */
    public static Set<String> getQuestionTypes() {
        Set<String> types = new HashSet<String>();
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

    public boolean checkAnswer() {
        return correctAnswer.equals(textAnswer);
    }

    public void setTextAnswer(String answer) {
        this.textAnswer = answer;
    }
}
