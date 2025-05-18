package com.example.beans;

import java.io.Serializable;

public class CgpaCalculatorBean implements Serializable {
    private double[] marks;      
    private double[] credits;    
    private int numberOfSubjects;
    public CgpaCalculatorBean() {
    }
    public void setMarks(double[] marks) {
        this.marks = marks;
    }
    public double[] getMarks() {
        return marks;
    }
    public void setCredits(double[] credits) {
        this.credits = credits;
    }
    public double[] getCredits() {
        return credits;
    }
    public void setNumberOfSubjects(int numberOfSubjects) {
        this.numberOfSubjects = numberOfSubjects;
    }
    public int getNumberOfSubjects() {
        return numberOfSubjects;
    }

    public double calculateCgpa() {
        if (marks == null || credits == null || marks.length != credits.length)
            return 0.0;
        double totalPoints = 0.0;
        double totalCredits = 0.0;
        for (int i = 0; i < marks.length; i++) {
            double gradePoint = convertMarksToGradePoint(marks[i]);
            totalPoints += gradePoint * credits[i];
            totalCredits += credits[i];
        }
        if (totalCredits == 0)
            return 0.0;
        return totalPoints / totalCredits;
    }

    private double convertMarksToGradePoint(double marks) {
        if (marks >= 90) return 10;
        else if (marks >= 80) return 9;
        else if (marks >= 70) return 8;
        else if (marks >= 60) return 7;
        else if (marks >= 50) return 6;
        else if (marks >= 40) return 5;
        else return 0;
    }
}
