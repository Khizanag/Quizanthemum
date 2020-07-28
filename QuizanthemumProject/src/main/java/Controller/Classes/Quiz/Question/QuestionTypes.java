package Controller.Classes.Quiz.Question;

public interface QuestionTypes {

    /** There is one blank field for user and he/she should write answer about topic written in question statement */
    int STANDARD = 0;

    /** In text there are several empty spaces which user should fill with appropriate text */
    int FILL_BLANK = 1;

    /** classic test question, where there is question statement and multiple choice */
    int MULTI_CHOICE = 2;

    /** Statement looks like this: Name 5 Georgian cities, and there will be five fields to fill */
    int MULTI_ANSWER = 3;

    /** Classic test, there are multiple possible answers and any number from them can be right ones */
    int MULTI_CHOICE_MULTI_ANSWER = 4;

    /** There are two columns, in each there are written some possible answers
      *     user should connect each answer from left column to right one.
      */
    int MATCHING = 5;

}
