package com.rsh.model;

public class Stu_Team {
    private int TID;
    private String StuID;
    private Boolean Position;

    public Stu_Team(int TID, String stuID, Boolean position) {
        this.TID = TID;
        StuID = stuID;
        Position = position;
    }

    public Stu_Team() {
    }

    @Override
    public String toString() {
        return "Stu_Team{" +
                "TID=" + TID +
                ", StuID='" + StuID + '\'' +
                ", Position=" + Position +
                '}';
    }

    public int getTID() {
        return TID;
    }

    public void setTID(int TID) {
        this.TID = TID;
    }

    public String getStuID() {
        return StuID;
    }

    public void setStuID(String stuID) {
        StuID = stuID;
    }

    public Boolean getPosition() {
        return Position;
    }

    public void setPosition(Boolean position) {
        Position = position;
    }
}
