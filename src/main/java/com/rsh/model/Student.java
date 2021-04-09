package com.rsh.model;

public class Student {
    private String StuID;
    private String Password;
    private boolean Sex;
    private String StuName;

    public Student(String stuID, String password, boolean sex, String stuName) {
        StuID = stuID;
        Password = password;
        Sex = sex;
        StuName = stuName;
    }

    public Student() {
    }

    @Override
    public String toString() {
        return "Student{" +
                "StuID='" + StuID + '\'' +
                ", Password='" + Password + '\'' +
                ", Sex=" + Sex +
                ", StuName='" + StuName + '\'' +
                '}';
    }

    public String getStuID() {
        return StuID;
    }

    public void setStuID(String stuID) {
        StuID = stuID;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public boolean isSex() {
        return Sex;
    }

    public void setSex(boolean sex) {
        Sex = sex;
    }

    public String getStuName() {
        return StuName;
    }

    public void setStuName(String stuName) {
        StuName = stuName;
    }
}
