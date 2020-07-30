<#--
    freemarker是一种基于模板的，用来生成输出文本的通用工具，所以
    我们必须要定制符合自己的业务模板，然后生成自己的html页面，freemarker是通过
    freemarker.template.Configuration这个对象对模板进行加载的(它也处理创建和缓存预解析模板的工作)
    然后我们通过getTemplate方法获取你想要的模板，有一点要注意：
    freemarker.tempalte.Configuration在你整个应用必须保证唯一实例
-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>静态模板</title>
</head>
<body>
    <#-- 新闻标题 -->
    <h1 align="center">${title}</h1>
    <#-- 新闻来源 和 发布时间 -->
    <p align="center">
        新闻来源：${source} &nbsp;&nbsp;
        发布时间：${putTime?datetime}
    </p>
    <#-- 新闻内容-->
    <p style='text-index: 2em'>
        ${content}
    </p>
</body>
</html>
