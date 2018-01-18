<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/16
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student page</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="bootstrap/jquery.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container-fluid" id="studentbody">
        <div class="row">
            <select v-model="selectType" class="selectpicker form-control" style="width:100px;float: left">
                <option value="">请选择类型</option>
                <option value="sid">编号</option>
                <option value="sname">姓名</option>
                <option value="age">年龄</option>
                <option value="sex">性别</option>
            </select>
            <input v-model="SearchText" type="text"  class="form-control" placeholder="Search" style="width:200px;float: left"/>
            <input type="button" v-on:click="queryallstudent" class="form-control" value="Search" style="width: 100px;"/>
            <button type="button" class="btn btn-primary" v-on:click="addstudent">增加</button>
        </div>
        <table align="center" width="80%" border="1px" style="margin-top: 20px">
            <tr>
                <td align="center">编号</td>
                <td align="center">年龄</td>
                <td align="center">性别</td>
                <td align="center">姓名</td>
                <td align="center">操作</td>
            </tr>
            <tr v-for="stu in StudentList.MyStudent">
                <td align="center">{{stu.sid}}</td>
                <td align="center">{{stu.age}}</td>
                <td align="center">{{stu.sex}}</td>
                <td align="center">{{stu.sname}}</td>
                <td align="center">
                    <button class="btn btn-primary" v-on:click="updateStudent(stu)">修改</button>
                    <button class="btn btn-danger" v-on:click="deletestudent(stu)">删除</button>
                </td>
            </tr>
        </table>
        <!--modal  start-->
        <div class="modal fade" tabindex="-1" role="dialog" id="StudentModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label class="control-label">年龄：</label>
                                <select class="form-control" v-model="student.age">
                                    <option v-for="sage in 120" v-bind:value="sage">{{sage}}</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="control-label">姓名：</label>
                                <input type="text" class="form-control" v-model="student.sname"/>
                            </div>
                            <div class="form-group">
                                <label class="control-label">性别</label>
                                <select class="form-control" v-model="student.sex">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" v-on:click="savestudent">提交</button>
                    </div>
                </div>
            </div>
        </div>
        <!--modal  end-->
    </div>
</body>
    <script type="text/javascript" src="bootstrap/vue.js"></script>
    <script type="text/javascript">
        var vue=new Vue({
            el:"#studentbody",
            data:{
                StudentList:{MyStudent:[]},
                student:{},
                saveUrlPath:"",
                selectType:"",
                SearchText:"",
                SearchStudent:{}
            },
            methods:{
                queryallstudent:function () {

                    pagin

                    var this_=this;
                    console.log(this_.selectType);
                    console.log(this_.SearchText);
                    if(this_.selectType!=""){
                        this_.SearchStudent[this_.selectType]=this_.SearchText;
                    }else{
                        this_.SearchStudent['sid']="";
                    }

                    console.log(JSON.stringify(this_.SearchStudent));
                    $.ajax({
                        url:"queryallstudent.action",
                        type:"post",
                        dataType:"json",
                        data:JSON.stringify(this_.SearchStudent),
                        contentType:"application/json",
                        success:function(data){
                            console.log(JSON.stringify(data))
                            this_.StudentList.MyStudent=data;
                        }
                    });
                },
                deletestudent:function(object){
                    var this_=this;
                    $.ajax({
                       url:"deletestudent.action",
                       type:"post",
                       data:JSON.stringify(object),
                       contentType: "application/json",
                       dataType:"json",
                       success:function(data){
                            this_.queryallstudent();
                        }
                    });
                },
                addstudent:function () {
                    var this_=this;
                    this_.showStudentmodel();
                    this_.saveUrlPath="addstudent.action";
                },
                savestudent:function () {
                    var this_=this;
                    $.ajax({
                        url:this_.saveUrlPath,
                        type:"post",
                        data:JSON.stringify(this_.student),
                        contentType: "application/json",
                        dataType:"json",
                        success:function(data){
                            console.log(data);
                        }
                    });
                    this_.hideStudentModel();
                    this_.queryallstudent();
                },
                updateStudent:function (object) {
                    var this_=this;
                    $.ajax({
                       url:"querystudent.action",
                       type:"post",
                       data:{sid:object.sid},
                       success:function (data) {
                           console.log(JSON.stringify(data));
                           this_.student=data;
                       }
                    });
                    this_.showStudentmodel();
                    this_.saveUrlPath="updateStudent.action";
                },
                showStudentmodel:function(){
                    $("#StudentModal").modal('show');
                },
                hideStudentModel:function () {
                    $("#StudentModal").modal('hide');
                }
            }
        });
        vue.queryallstudent();

    </script>
</html>
