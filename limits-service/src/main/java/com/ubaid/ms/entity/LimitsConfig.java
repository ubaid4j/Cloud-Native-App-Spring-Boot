package com.ubaid.ms.entity;


public class LimitsConfig {
    private int max;
    private int min;

    public LimitsConfig() {

    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public int getMin() {
        return min;
    }

    public void setMin(int min) {
        this.min = min;
    }

    public LimitsConfig(int max, int min) {
        this.max = max;
        this.min = min;
    }

}
