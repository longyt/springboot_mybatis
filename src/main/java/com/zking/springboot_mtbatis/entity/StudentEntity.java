package com.zking.springboot_mtbatis.entity;

/**
 * @author: longyt
 * @create: 2018-01-16 9:40
 * @desc:
 **/
public class StudentEntity {
    private Integer sid;
    private Integer age;
    private String sex;
    private String sname;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    @Override
    public String toString() {
        return "StudentEntity{" +
                "sid=" + sid +
                ", age=" + age +
                ", sex='" + sex + '\'' +
                ", sname='" + sname + '\'' +
                '}';
    }
}
