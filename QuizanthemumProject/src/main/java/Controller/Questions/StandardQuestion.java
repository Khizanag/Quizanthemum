package Controller.Questions;

public class StandardQuestion extends Question {
    private boolean autoCheck;

    public StandardQuestion(boolean autoCheck) {
        super("StandardQuestion");
        this.autoCheck = autoCheck;
    }

    @Override
    public String getType() {
        return super.getType();
    }

    @Override
    public void setStatement(String statement) {
        super.setStatement(statement);
    }

    @Override
    public boolean checkAnswer() {
        return super.checkAnswer();
    }

    @Override
    public void setTextAnswer(String answer) {
        super.setTextAnswer(answer);
    }
}
