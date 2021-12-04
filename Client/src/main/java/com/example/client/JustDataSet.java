package com.example.client;

public class JustDataSet {

    private int count;

    public JustDataSet() {
    }

    public JustDataSet(int count) {
        this.count = count;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "count = " + count;
    }
}
