package Tools;

import java.util.ArrayList;
import java.util.List;

public class FillTextTokenizer {

    public static final String LEFT_BOUND_DELIMS = "{(<_ ";
    public static final String RIGHT_BOUND_DELIMS = " _>)}";

    private String text;
    private List<String> tokens;
    private int index;

    public FillTextTokenizer(String text){
        this.text = text;
        tokenizeText();
        index = 0;
    }

    private void tokenizeText(){
        tokens = new ArrayList<>();
        boolean nextIsToFill = false;
        int currIndex = 0;
        while(currIndex < text.length()-1){
            String delims = (nextIsToFill) ? RIGHT_BOUND_DELIMS : LEFT_BOUND_DELIMS;
            int lastIndex = text.indexOf(delims, currIndex);
            if(lastIndex == -1)
                lastIndex = text.length();
            String newToken = text.substring(currIndex, lastIndex);
            tokens.add(newToken);
            currIndex = lastIndex + delims.length();

            nextIsToFill = !nextIsToFill;
        }
    }

    public boolean hasMoreToken(){
        return index < tokens.size();
    }

    // should be called after hasMoreToken()
    public String getNextToken(){
        String result = tokens.get(index);
        index += 1;
        return result;
    }

}
