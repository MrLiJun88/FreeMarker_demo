<h4>FreeMarker 的数据类型</h4>

<#--
    FreeMarker 常用指令
        1:assign 自定义变量指令
        语法:
            <#assign 变量名=值>
            <#assign 变量名=值   变更名=值> （定义多个变量）

        2:if,elseif else 逻辑判断指令
        格式：
            <#if condition>
                ...
            <#elseif condition2>
                ...
            <#elseif condition3>
                ...
            <#else>
                ...
            <#if>   注：conditon 将被计算成布尔值的表达式
                        elseif 和 else 指令，是可选的

        3:list指令
        格式：
            1：<#list sequence as item>
               </list>
            2:
               <#list sequence as item>
                    <#else>
                        当没有选项时，执行else指令
               </list>
            注： else 是可选的，sequence:想要迭代的项，可以是序列或集合的表达式
                item：循环变量的名称
                当没有迭代项时，才使用 else 指令

        4:macro 自定义指令（宏）
            1：基本使用
                格式：
                    <#macro 指令名>
                        指令内容
                    </#macro>
                使用：
                    <@指令名></@指令名>
            2:有参数的自定义指令
                格式：
                    <#macro 指令名 参数1 参数2>
                        指令内容
                    </#macro>
                使用：
                    <@指令名  参数1=参数1值 参数2=参数2值></@指令名>
           注：指令可以被多次使用；自定义指令中可以包含字符，也可以包含内置指令
-->
<#-- 定义单个变量-->
<h5>定义单个变量</h5>
<#assign str = "hello">
${str}<br>
<h5>定义多个变量</h5>
<#assign str=1 values=["张三","李四","王五","二麻"]>
${str}<br>
${values?join(" ")}<br>
<hr>
<h5>if,elseif else</h5>
<#assign score=40>
    <#if score lt 60>
        <h6>不及格</h6>
    <#elseif score == 60>
        <h6>及格</h6>
    <#elseif score gt 60 && score lt 80>
        <h6>良好</h6>
    <#else>
        <h6>优秀</h6>
    </#if>
<hr>
<h5>判断数据是否存在</h5>
<#assign list="">
<#if list??>
    数据存在
    <#else>
    数据不存在
</#if><br>
<#if list2??>
    数据存在
<#else>
    数据不存在
</#if>
<hr>
<h5>list配合else遍历</h5>
<#list arrays as item>
    ${item} |
</#list>
<br>
<#-- 判断数据不为空，再执行遍历，如果数据为空，直接遍历会报错-->
<#if arrays2??>
    <#list arrays2 as item>
        ${item}
    </#list>
</#if>
<br>
<#-- 当序列没有数据项时，使用默认信息-->
<#assign user3=['']>
<#list user3 as user>
    ${user}
    <#else>
    用户数据不存在
</#list>
<hr>
<h5>macro 自定义指令</h5>
<#-- 自定义指令 -->
<#macro address02>
    <div><span style="color: aqua">hello world</span></div>
</#macro>
<#-- 使用自定义指令-->
<@address02></@address02>
<#-- 自定义有参数的指令-->
<#macro queryUserByIdAndName id name>
    通过id查询用户对象 - ${id}  - ${name}
</#macro>
<@queryUserByIdAndName id="1" name="lijun"></@queryUserByIdAndName>
<hr>
<h5>九九乘法表</h5>
<#macro cfb>
    <#list 1..9 as i>
        <#list 1..i as j>
            ${j} * ${i} = ${j * i} &nbsp;
        </#list>
        <br>
    </#list>
</#macro>
<@cfb></@cfb>
<hr>
<#macro cfb2 num>
    <#list 1..num as i>
        <#list 1..i as j>
            ${j} * ${i} = ${j * i} &nbsp;
        </#list>
        <br>
    </#list>
</#macro>
<@cfb2 num=4></@cfb2>
<hr>
<h5>nested 占位符使用</h5>
<#macro test>
    <#nested> <br>
    这是一段文本
    <#nested>
</#macro>
<@test>hello world</@test>