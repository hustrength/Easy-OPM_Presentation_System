package com.rsh.model;

public class Apply {
    private String ApplicantID;
    private int TID;
    private int Status;

    public Apply(String applicantID, int TID, int status) {
        ApplicantID = applicantID;
        this.TID = TID;
        Status = status;
    }

    public Apply() {
    }

    @Override
    public String toString() {
        return "Apply{" +
                "ApplicantID='" + ApplicantID + '\'' +
                ", TID=" + TID +
                ", Status=" + Status +
                '}';
    }

    public String getApplicantID() {
        return ApplicantID;
    }

    public void setApplicantID(String applicantID) {
        ApplicantID = applicantID;
    }

    public int getTID() {
        return TID;
    }

    public void setTID(int TID) {
        this.TID = TID;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int status) {
        Status = status;
    }
}
