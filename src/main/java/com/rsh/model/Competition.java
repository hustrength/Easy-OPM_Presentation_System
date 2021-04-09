package com.rsh.model;

public class Competition {
    private int CID;
    private String CName;
    private String Introduction;
    private String Publisher;

    public Competition(int CID, String CName, String introduction, String publisher) {
        this.CID = CID;
        this.CName = CName;
        Introduction = introduction;
        Publisher = publisher;
    }

    public Competition() {
    }

    @Override
    public String toString() {
        return "Competition{" +
                "CID=" + CID +
                ", CName='" + CName + '\'' +
                ", Introduction='" + Introduction + '\'' +
                ", Publisher='" + Publisher + '\'' +
                '}';
    }

    public int getCID() {
        return CID;
    }

    public void setCID(int CID) {
        this.CID = CID;
    }

    public String getCName() {
        return CName;
    }

    public void setCName(String CName) {
        this.CName = CName;
    }

    public String getIntroduction() {
        return Introduction;
    }

    public void setIntroduction(String introduction) {
        Introduction = introduction;
    }

    public String getPublisher() {
        return Publisher;
    }

    public void setPublisher(String publisher) {
        Publisher = publisher;
    }
}
