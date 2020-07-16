package Tools;
public class StringPair {

    private final String key;
    private final String value;

    public StringPair(String key, String value) {
        this.key = key;
        this.value = value;
    }

    public String getKey() {
        return key;
    }

    public String getValue() {
        return value;
    }

    public boolean equals(StringPair p) {
        return this.key.equals(p.key) && this.value.equals(p.value);
    }
}
