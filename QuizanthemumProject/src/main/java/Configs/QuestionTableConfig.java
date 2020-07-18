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
    public static final String QUESTION_TABLE_COLUMN_11_IS_PICTURE_QUESTION = "IS_PICTURE_QUESTION"; // boolean
    public static final String QUESTION_TABLE_COLUMN_12_NUM_CHOICE_STATEMENTS = "NUM_CHOICE_STATEMENTS";    // int

    public static final String QUESTION_TABLE_COLUMN_13_CHOICE_STATEMENT_0 = "CHOICE_STATEMENT_0";
    // ...
    public static final String QUESTION_TABLE_COLUMN_28_CHOICE_STATEMENT_15 = "CHOICE_STATEMENT_15";

    public static final String QUESTION_TABLE_COLUMN_29_TEXT_ANSWER = "TEXT_ANSWER";
    public static final String QUESTION_TABLE_COLUMN_30_IS_PICTURE_ANSWER = "IS_PICTURE_ANSWER";

    public static final String QUESTION_TABLE_COLUMN_31_NUM_ANSWERS = "NUM_ANSWERS";

    public static final String QUESTION_TABLE_COLUMN_32_ANSWER_0 = "ANSWER_0";
    // ...
    public static final String QUESTION_TABLE_COLUMN_47_ANSWER_15 = "ANSWER_15";

    public static final String QUESTION_TABLE_ITH_CHOICE_TEXT = "CHOICE_STATEMENT_";
    public static final String QUESTION_TABLE_ITH_ANSWER_TEXT = "ANSWER_";

}
