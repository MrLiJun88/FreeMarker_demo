package servlet;

import pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

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
        /**空数据*/
        req.setAttribute("str1",null);
        req.setAttribute("str2","");
        /**序列(array,list,set)*/
        String[] arrays = new String[]{"arr1","arr2","arr3","arr4"};
        req.setAttribute("arrays",arrays);
        /**List操作*/
        List<String> list = Arrays.asList("java","linux","html","ajax");
        req.setAttribute("list",list);
        /**JavaBean集合*/
        List<User> userList = new ArrayList<>();
        userList.add(new User("lijun",25));
        userList.add(new User("zhangsan",33));
        userList.add(new User("wangwu",77));
        req.setAttribute("userList",userList);
        /**map操作*/
        Map<String,String> map = new HashMap<>();
        map.put("sh","上海");
        map.put("bj","北京");
        map.put("nj","南京");
        map.put("xa","西安");
        req.setAttribute("map",map);
        req.getRequestDispatcher("template/f02.ftl").forward(req,resp);
    }
}
