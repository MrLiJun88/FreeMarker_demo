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
 */

@WebServlet(value = "/f01")
public class FreeMarker01 extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setAttribute("msg","Hello FreeMarker");
        req.getRequestDispatcher("template/f01.ftl").forward(req,resp);
    }
}
