package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * @Author: LiJun
 * @Date: 2020/7/29 9:43 上午
 * FreeMarker的数据类型
 */

@WebServlet(value = "/f03")
public class FreeMarker03 extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        /**序列(array,list,set)*/
        String[] arrays = new String[]{"arr1","arr2","arr3","arr4"};
        req.setAttribute("arrays",arrays);
        req.getRequestDispatcher("template/f03.ftl").forward(req,resp);
    }
}
