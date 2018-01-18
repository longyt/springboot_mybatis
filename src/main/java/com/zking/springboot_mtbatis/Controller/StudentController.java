package com.zking.springboot_mtbatis.Controller;

import com.zking.springboot_mtbatis.dao.StudentDao;
import com.zking.springboot_mtbatis.entity.StudentEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @author: longyt
 * @create: 2018-01-16 9:42
 * @desc:
 **/
@Controller
public class StudentController {

    @Autowired
    private StudentDao studentDao;


    @ResponseBody
    @RequestMapping(value = "/queryallstudent")
    public List<StudentEntity> queryallstudent(@RequestBody StudentEntity studentEntity){
        return studentDao.QueryStudent(studentEntity);
    }
    @ResponseBody
    @RequestMapping(value = "deletestudent")
    public String deletestudent(@RequestBody StudentEntity studentEntity){
        studentDao.deleteStudent(studentEntity);
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "addstudent")
    public String addStudent(@RequestBody StudentEntity studentEntity){
        studentDao.addStudent(studentEntity);
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "updateStudent")
    public String updateStudent(@RequestBody StudentEntity studentEntity){
        studentDao.updateStudent(studentEntity);
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "querystudent")
    public StudentEntity querystudent(@RequestParam String  sid){
        return studentDao.querystudent(Integer.parseInt(sid));
    }
}
