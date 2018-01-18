package com.zking.springboot_mtbatis.dao;

import com.zking.springboot_mtbatis.entity.StudentEntity;

import java.util.List;

public interface StudentDao {
    public List<StudentEntity> QueryStudent(StudentEntity studentEntity);

    public void deleteStudent(StudentEntity studentEntity);

    public void addStudent(StudentEntity studentEntity);

    public void updateStudent(StudentEntity studentEntity);

    public StudentEntity querystudent(int sid);
}
