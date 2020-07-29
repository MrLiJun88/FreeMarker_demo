package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * @Author: LiJun
 * @Date: 2020/7/29 9:43 上午
 * FreeMarker的数据类型
 */

@WebServlet(value = "/f02")
public class FreeMarker02 extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        /**布尔类型*/
        req.setAttribute("flag",false);
        /**日期类型*/
        req.setAttribute("date",new Date());
        /**数值类型*/
        req.setAttribute("age",25);
        req.setAttribute("salary",245.456);
        req.setAttribute("avg",0.005);
        /**字符串类型*/
        req.setAttribute("msg","hello world");
        req.setAttribute("msg2","welcome");
        req.getRequestDispatcher("template/f02.ftl").forward(req,resp);
    }
}
