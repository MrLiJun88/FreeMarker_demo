package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author: LiJun
 * @Date: 2020/7/29 9:43 上午
 * FreeMarker的数据类型
 */

@WebServlet(value = "/f04")
public class FreeMarker04 extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        req.getRequestDispatcher("template/f04.ftl").forward(req,resp);
    }
}
