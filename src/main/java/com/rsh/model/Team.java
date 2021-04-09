package com.rsh.model;

public class Team {
    private int TID;
    private String TName;
    private int CID;
    private String CaptainID;
    private int VacantPos;

    public Team(int TID, String TName, int CID, String captainID, int vacantPos) {
        this.TID = TID;
        this.TName = TName;
        this.CID = CID;
        CaptainID = captainID;
        VacantPos = vacantPos;
    }

    public Team() {
    }

    @Override
    public String toString() {
        return "Team{" +
                "TID=" + TID +
                ", TName='" + TName + '\'' +
                ", CID=" + CID +
                ", CaptainID='" + CaptainID + '\'' +
                ", VacantPos=" + VacantPos +
                '}';
    }

    public int getTID() {
        return TID;
    }

    public void setTID(int TID) {
        this.TID = TID;
    }

    public String getTName() {
        return TName;
    }

    public void setTName(String TName) {
        this.TName = TName;
    }

    public int getCID() {
        return CID;
    }

    public void setCID(int CID) {
        this.CID = CID;
    }

    public String getCaptainID() {
        return CaptainID;
    }

    public void setCaptainID(String captainID) {
        CaptainID = captainID;
    }

    public int getVacantPos() {
        return VacantPos;
    }

    public void setVacantPos(int vacantPos) {
        VacantPos = vacantPos;
    }
}
