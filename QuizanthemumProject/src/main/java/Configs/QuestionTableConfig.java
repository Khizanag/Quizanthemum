package Configs;

public interface QuestionTableConfig {

    /* question's table */
    public static final String QUESTION_TABLE_COLUMN_1_ID = "ID";   // int
    public static final String QUESTION_TABLE_COLUMN_2_TYPE = "TYPE";   // int
    public static final String QUESTION_TABLE_COLUMN_3_IS_AUTO_GRADED = "IS_AUTO_GRADED";   // boolean
    public static final String QUESTION_TABLE_COLUMN_4_MAX_SCORE = "MAX_SCORE"; // double
    public static final String QUESTION_TABLE_COLUMN_5_HEADER_STATEMENT = "HEADER_STATEMENT"; // string
    public static final String QUESTION_TABLE_COLUMN_6_COMMENT = "COMMENT"; // string
    public static final String QUESTION_TABLE_COLUMN_7_SOURCE = "SOURCE";   // string
    public static final String QUESTION_TABLE_COLUMN_8_CREATION_DATE = "CREATION_DATE"; // Date
    public static final String QUESTION_TABLE_COLUMN_9_QUIZ_ID = "QUIZ_ID"; // int
    public static final String QUESTION_TABLE_COLUMN_10_TEXT_STATEMENT = "TEXT_STATEMENT"; // blob || BigText
    public static final String QUESTION_TABLE_COLUMN_11_NUM_CHOICE_STATEMENTS = "NUM_CHOICE_STATEMENTS";    // int

    public static final String QUESTION_TABLE_COLUMN_12_CHOICE_STATEMENT_1 = "CHOICE_STATEMENT_1";
    // ...
    public static final String QUESTION_TABLE_COLUMN_27_CHOICE_STATEMENT_16 = "CHOICE_STATEMENT_16";

    public static final String QUESTION_TABLE_COLUMN_28_TEXT_ANSWER = "TEXT_ANSWER";

    public static final String QUESTION_TABLE_COLUMN_29_ANSWER_1 = "ANSWER_1";
    // ...
    public static final String QUESTION_TABLE_COLUMN_44_ANSWER_16 = "ANSWER_16";

}
