package com.tu.servlet;

import com.tu.mapper.StudentMapper;
import com.tu.mapper.TeacherMapper;
import com.tu.mapper.impl.StudentMapperImpl;
import com.tu.mapper.impl.TeacherMapperImpl;
import com.tu.pojo.Student;
import com.tu.pojo.Teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/InfoServlet")
public class InfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String oper = req.getParameter("oper");
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();

        if ("root".equals(oper)) { // 管理员查看所有信息，允许增删改查，添加分页
            int total; // 数据库总共几条
            int pid; // 当前第几页
            int count = 7; // 每页十五条
            int pagetotal; // 最多有几页
            { // 学生分页
                StudentMapper sm = new StudentMapperImpl();
                total = sm.queryCount();
                pid = 1; // 当前第几页
                String temp = req.getParameter("stupid");
                if (temp != null) // 预料pid为空的情况
                    pid = Integer.parseInt(temp);
                pagetotal = total / count; // 至多几页
                if (total % count != 0) // 无法整除则需多一页
                    pagetotal += 1;
                else if (pagetotal == 0) // 0页则设置为1页
                    pagetotal = 1;
                if (pid > pagetotal) // 若当前页数比总页数大
                    pid = pagetotal;
                if (pid <= 0) // 若当前页数非正数
                    pid = 1;
                int start = (pid - 1) * count;
                List<Student> stuList = sm.findAllByPage(start, count);
                session.setAttribute("stupagetotal", pagetotal);
                session.setAttribute("stupid", pid);
                session.setAttribute("stuList", stuList);
            }
            { // 老师分页
                TeacherMapper tm = new TeacherMapperImpl();
                total = tm.queryCount();
                String temp = req.getParameter("teachpid");
                pid = 1; // 当前第几页
                if (temp != null) // 预料pid为空的情况
                    pid = Integer.parseInt(temp);
                pagetotal = total / count; // 至多几页
                if (total % count != 0) // 无法整除则需多一页
                    pagetotal += 1;
                else if (pagetotal == 0) // 0页则设置为1页
                    pagetotal = 1;
                if (pid > pagetotal) // 若当前页数比总页数大
                    pid = pagetotal;
                if (pid <= 0) // 若当前页数非正数
                    pid = 1;
                int start = (pid - 1) * count;
                List<Teacher> teachList = tm.findAllByPage(start, count);
                session.setAttribute("teachpagetotal", pagetotal);
                session.setAttribute("teachpid", pid);
                session.setAttribute("teachList", teachList);
            }
            resp.sendRedirect("allmessage.jsp");
        } else if ("detail".equals(oper)) { // 管理员查看详情，session需覆盖下两个elseif
            String man = req.getParameter("man");
            if ("stu".equals(man)) {
                String userid = req.getParameter("userId");
                StudentMapper sm = new StudentMapperImpl();
                Student stu = sm.getAllById(Integer.parseInt(userid));
                session.setAttribute("stu", stu);
                resp.sendRedirect("studentdetail.jsp");
            } else if ("teach".equals(man)) {
                String teachid = req.getParameter("teachId");
                TeacherMapper tm = new TeacherMapperImpl();
                Teacher teach = tm.getAllById(Integer.parseInt(teachid));
                session.setAttribute("teach", teach);
                resp.sendRedirect("teacherdetail.jsp");
            }
        } else if ("student".equals(oper)) { // session返回学生信息
            String temp = session.getAttribute("userid").toString();
            int userid = Integer.parseInt(temp);
            StudentMapper sm = new StudentMapperImpl();
            Student s = sm.getAllById(userid);
            session.setAttribute("stu", s);
            resp.sendRedirect("student.jsp");
        } else if ("teacher".equals(oper)) { // session返回老师信息
            String temp = session.getAttribute("teachid").toString();
            int teachid = Integer.parseInt(temp);
            TeacherMapper tm = new TeacherMapperImpl();
            Teacher t = tm.getAllById(teachid);
            session.setAttribute("teach", t);
            resp.sendRedirect("teacher.jsp");
        } else if ("studentupdate".equals(oper)) { // 学生信息更新
            int userId = Integer.parseInt(req.getParameter("userId"));
            String userName = req.getParameter("userName");
            int userSex = Integer.parseInt(req.getParameter("userSex"));
            int userAge = Integer.parseInt(req.getParameter("userAge"));
            String markYear = req.getParameter("markYear");
            int classId = Integer.parseInt(req.getParameter("classId"));
            int majorId = Integer.parseInt(req.getParameter("majorId"));

            Student s = new Student(userId, userName, userSex, userAge, markYear, classId, majorId);
            StudentMapper sm = new StudentMapperImpl();
            boolean isU = sm.updateStudent(s);

            String type = session.getAttribute("type").toString();
            if (isU) { // 更新成功
                if ("3".equals(type)) {
                    out.print("<script>alert('update success');</script>");
                    out.print("<script>location.href='/JWXT/InfoServlet?oper=root';</script>");
                } else {
                    Student stu = sm.getAllById(userId);
                    session.setAttribute("stu", stu);
                    out.print("<script>alert('update success');</script>");
                    out.print("<script>location.href='student.jsp';</script>");
                }
            }
        } else if ("teacherupdate".equals(oper)) {
            int teachId = Integer.parseInt(req.getParameter("teachId"));
            String teachName = req.getParameter("teachName");
            int teachSex = Integer.parseInt(req.getParameter("teachSex"));
            int teachAge = Integer.parseInt(req.getParameter("teachAge"));
            String degree = req.getParameter("degree");
            String title = req.getParameter("title");
            String teachYear = req.getParameter("teachYear");
            int roomId = Integer.parseInt(req.getParameter("roomId"));
            int classId = Integer.parseInt(req.getParameter("classId"));

            Teacher t = new Teacher(teachId, teachName, teachSex, teachAge, degree, title, teachYear, roomId, classId);
            TeacherMapper tm = new TeacherMapperImpl();
            boolean isU = tm.updateTeacher(t);

            String type = session.getAttribute("type").toString();
            if (isU) { // 更新成功
                if ("3".equals(type)) {
                    out.print("<script>alert('update success');</script>");
                    out.print("<script>location.href='/JWXT/InfoServlet?oper=root';</script>");
                } else {
                    Teacher tea = tm.getAllById(teachId);
                    session.setAttribute("teach", tea);
                    out.print("<script>alert('update success');</script>");
                    out.print("<script>location.href='teacher.jsp';</script>");
                }
            }
        } else if ("studel".equals(oper)) {
            int userId = Integer.parseInt(req.getParameter("userId"));
            StudentMapper sm = new StudentMapperImpl();
            int count = sm.delStudentById(userId);
            if (count > 0) {
                out.print("<script>alert('delete success');</script>");
                out.print("<script>location.href='/JWXT/InfoServlet?oper=root';</script>");
            }
        } else if ("teachdel".equals(oper)) {
            int teachId = Integer.parseInt(req.getParameter("teachId"));
            TeacherMapper tm = new TeacherMapperImpl();
            int count = tm.delTeacherById(teachId);
            if (count > 0) {
                out.print("<script>alert('delete success');</script>");
                out.print("<script>location.href='/JWXT/InfoServlet?oper=root';</script>");
            }
        }
    }
}
