package Tools;

public class Pair <T> implements Comparable<Pair>{

    private T first;
    private T second;

    public Pair(T first, T second){
        this.first = first;
        this.second = second;
    }

    public T getSecond() {
        return second;
    }

    public void setSecond(T second) {
        this.second = second;
    }

    public T getFirst() {
        return first;
    }

    public void setFirst(T first) {
        this.first = first;
    }

    @Override
    public int compareTo(Pair o) {
        return (o.equals(this)) ? 0 : 1;
    }

    @Override
    public boolean equals(Object o){
        Pair<T> oo = (Pair<T>)o;
        return this.first.equals(oo.first) && this.second.equals(oo.second);
    }

}
