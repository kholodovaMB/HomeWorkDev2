package org.HMB;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class SumCalculatorTest {
    private SumCalculator result;

    @BeforeEach
    public void beforeEach() {
        result = new SumCalculator();
    }
    @Test
    void sumCorrectFor1() {
        //When
        int actual = result.sum(1);

        //Then
        int expected = 1;
        Assertions.assertEquals(expected, actual);
    }

    @Test
    void sumCorrectFor3() {
        //When 3
        int actual = result.sum(3);

        //Then
        int expected = 6;
        Assertions.assertEquals(expected, actual);
    }

    @Test
    void sumCorrectFor0() {

        Assertions.assertThrows(IllegalArgumentException.class, () -> {
            int actual = result.sum(-1);
        });
    }
}