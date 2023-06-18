package org.HMB;

public class SumCalculator {
    public int sum(int n){
        int res = 0;
        if (n > 0) {
            for (int i = 1; i <= n; i++) {
                res += i;
            }
            return res;
        } else {
            throw new IllegalArgumentException("n not correct");
        }
    }

}
