package com.klef;
public class Education {
    private String institution;
    private String degree;
    private String year;

    // Constructor
    public Education(String institution, String degree, String year) {
        this.institution = institution;
        this.degree = degree;
        this.year = year;
    }

    // Getters and Setters
    public String getInstitution() {
        return institution;
    }

    public void setInstitution(String institution) {
        this.institution = institution;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }
    
}