package servlet;

import freemarker.template.Configuration;
import freemarker.template.Template;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author: LiJun
 * @Date: 2020/7/30 10:00 上午
 */
@WebServlet(value = "/template")
public class TemplateServlet extends HttpServlet {


    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /**实体化模板对象*/
        Configuration configuration = new Configuration();
        /**设置加载模板的上下文 以及加载模板的路径（模板存放路径）*/
        configuration.setServletContextForTemplateLoading(getServletContext(),"/template");
        /**设置模板的编码格式*/
        configuration.setDefaultEncoding("UTF-8");
        /**加载模板文件，获取模板对象*/
        Template template = configuration.getTemplate("template.ftl");

        /**设置数据模型*/
        Map<String,Object> modelMap = new HashMap<>();
        modelMap.put("title","腾讯欲买走搜狗，背后的真实原因并非因为百度");
        modelMap.put("source","新浪财经官方帐号");
        modelMap.put("putTime",new Date());
        modelMap.put("content","其实早在2013年，企鹅试图抢占搜索的市场份额，于是开始了寻找一只狗。于是企鹅找到了狗妈——搜狐。搜狗是搜狐公司的一款搜索引擎，更确切的说是一个产品。这些年大风大浪过后，搜狗还干的不错。企鹅也曾自己试图组建团队开发一个搜索引擎，事实证明没有这个基因，做不出像微信一样优秀的产品。企鹅也很少在江湖上再提起搜搜，搜搜去哪了呢？企鹅和狐狸一拍即合，注资4.48亿美元把搜搜装进了搜狗。");

        /**获取项目根目录*/
        //String basePath = req.getServletContext().getRealPath("");
        String basePath = "/Users/lijun/IdeaProjects/FreeMarker_demo";
        /**设置html的存放路径*/
        File htmlFile = new File(basePath + "/html");
        /**判断文件是否存在*/
        if(! htmlFile.exists()){
            /**如果文件目录不存在，则创建文件目录*/
            htmlFile.mkdir();
        }
        /**得到生成的文件名，（生成随机不重复的文件名）*/
        String fileName = System.currentTimeMillis()  + ".html";
        /**创建html文件*/
        File file = new File(htmlFile,fileName);
        /**获取文件对应的输出流*/
        FileWriter fileWriter = new FileWriter(file);
        /**生成html(将数据模型填充到模板中)*/
        try{
            template.process(modelMap,fileWriter);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            /**关闭资源*/
            fileWriter.flush();
            fileWriter.close();
        }
    }
}
