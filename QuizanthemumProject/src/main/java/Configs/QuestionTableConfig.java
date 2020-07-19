package Configs;

public interface QuestionTableConfig {

    /* question's table */

    int COLUMN_COUNT = 45;
    int STATEMENT_START_COL = 12;
    int STATEMENTS_NUM = 16;
    int ANSWER_START_COL = 30;
    int ANSWERS_NUM = 16;

    String QUESTION_TABLE_COLUMN_1_ID = "ID";                                       // int
    String QUESTION_TABLE_COLUMN_2_TYPE = "TYPE";                                   // int
    String QUESTION_TABLE_COLUMN_3_IS_AUTO_GRADED = "IS_AUTO_GRADED";               // boolean
    String QUESTION_TABLE_COLUMN_4_MAX_SCORE = "MAX_SCORE";                         // double
    String QUESTION_TABLE_COLUMN_5_HEADER_STATEMENT = "HEADER_STATEMENT";           // string
    String QUESTION_TABLE_COLUMN_6_COMMENT = "COMMENT";                             // string
    String QUESTION_TABLE_COLUMN_7_SOURCE = "SOURCE";                               // string
    String QUESTION_TABLE_COLUMN_8_CREATION_DATE = "CREATION_DATE";                 // Date
    String QUESTION_TABLE_COLUMN_9_QUIZ_ID = "QUIZ_ID";                             // int

    /* statements */

    String QUESTION_TABLE_COLUMN_10_IS_PICTURE_STATEMENT = "IS_PICTURE_STATEMENT";  // boolean
    String QUESTION_TABLE_COLUMN_11_NUM_STATEMENTS = "NUM_STATEMENTS";              // int
    //    String QUESTION_TABLE_COLUMN_12_STATEMENT_0 = "STATEMENT_0";
    //    ...
    //    String QUESTION_TABLE_COLUMN_27_STATEMENT_15 = "STATEMENT_15";
    String QUESTION_TABLE_ITH_STATEMENT_TEXT = "STATEMENT_";

    /* answers */

    String QUESTION_TABLE_COLUMN_28_IS_PICTURE_ANSWER = "IS_PICTURE_ANSWER";        // boolean
    String QUESTION_TABLE_COLUMN_29_NUM_ANSWERS = "NUM_ANSWERS";                    // int
    //    String QUESTION_TABLE_COLUMN_30_ANSWER_0 = "ANSWER_0";
    //    ...
    //    String QUESTION_TABLE_COLUMN_45_ANSWER_15 = "ANSWER_15";
    String QUESTION_TABLE_ITH_ANSWER_TEXT = "ANSWER_";

}
