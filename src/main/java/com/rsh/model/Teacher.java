package com.rsh.model;

public class Teacher {
    private String TeaID;
    private String Password;
    private String TeaName;

    public Teacher(String teaID, String password, String teaName) {
        TeaID = teaID;
        Password = password;
        TeaName = teaName;
    }

    public Teacher() {
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "TeaID='" + TeaID + '\'' +
                ", Password='" + Password + '\'' +
                ", TeaName='" + TeaName + '\'' +
                '}';
    }

    public String getTeaID() {
        return TeaID;
    }

    public void setTeaID(String teaID) {
        TeaID = teaID;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getTeaName() {
        return TeaName;
    }

    public void setTeaName(String teaName) {
        TeaName = teaName;
    }
}
