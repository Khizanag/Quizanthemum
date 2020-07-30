package Tools;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class FillTextTokenizerTest {

    @Test
    public void testSimpleCase(){
        FillTextTokenizer tokenizer = new FillTextTokenizer(" wewew{(<_qqqqq_>)}wewewew{(<_qqqqq_>)}z");
        while(tokenizer.hasMoreToken()){
            System.out.println(tokenizer.getNextToken());
        }
    }

}