<h4>FreeMarker 的数据类型</h4>

<#--
    FreeMarker 数据类型
        布尔类型：
            在freemarker页面中不能直接输出，如果要输出需要转换为字符串
            方式一：?c
            方式二：?string 或 ?string('为true'时显示的内容','为false时显示的内容')
        日期类型：
            在freemarker中日期类型不能直接输出，需要转换成日期型字符串
            1:年月日 ?date
            2:时分秒 ?time
            3:年月日时分秒 ?datetime
            4 ?string() 自定义格式
        数值类型：
            在freemarker中数值类型可以直接输出
            1: 转字符串
                普通字符串: ?c
                货币型字符串：?string.currency
                百分比型字符串 ?string.percent
                指定小数位 ?string["0.##"] (保留两位小数)
        字符类型:
            在freemarker中字符串类型可以直接输出
            1:截取字符串(左闭右开) ?substring(start,end)
            2：首字母小写输出 ?uncap_first
            3：首字符大写输出  ?cap_first
            4：字母转小写输出   ?lower_case
            5：字母转大写输出   ?upper_case
            6：获取字符串长度：  ?length
            7：是否以指定字符开头(boolean类型）?starts_with("xx")?string
            8：是否以指定字符结尾（boolean类型）  ?ends_with("xx")?string
            9:获取指定字符的索引 ?index_of("xx")
            10：去除字符串前后空格：?trim
            11：替换指定字符串  ?replace("xx","xx")
       空值情况：
            freemarker提供了两个运算符来避免空值
            1：! 指定缺失变量的默认值
            ${value!}:如果value为空，则默认值是空字符串
            ￥{value!"默认值"} ，如果value是空，则默认值是字符串"默认值"

            2：?? 判断变量是否存在
            如果变量存在，则返回true,否则返回false
            ${(value??)?string} 或 ${(value??)?c}
       序列类型：
            1:（数组，List,Set）通过 list 指令输出序列
            <#list 序列名 as 元素名>
                ${元素名}
            </#list>

            获取序列的长度     ${序列名?size}
            获取序列元素的下标   ${元素名?index}
            获取第一个元素     ${序列名?first}
            获取最后一个元素   ${序列名?last}

            倒序输出    序列名?reverse
            升序输出    序列名?sort
            降序输出    序列名?sort?reverse
            指定字段名排序   序列名?sort_by("字段名") 注：一般是JavaBean集合，对应的字段名需要有get方法

       hash类型
            1：通过 key 获取 value
                <#list hash?keys as key>
                    ${key} -- ${hash[key]}
                </list>
            2:value遍历输出
                <#list hash?values as value>
                    ${value}
                </list>
-->
<h5>布尔类型</h5>
${flag?c}<br>
${flag?string}<br>
${flag?then('yes','no')}
<hr>
<h5>日期类型</h5>
${date?date}<br>
${date?time}<br>
${date?datetime}<br>
${date?string('yyyy:MM:dd:HH:mm:ss')}
<hr>
<h5>数值类型</h5>
${age}<br>
<#-- 将数值转换成字符类型-->
${salary?c}<br>
${avg}<br>
<#-- 将数值转换成货币类型-->
${salary?string.currency}<br>
<#--将数值转换成百分比类型 -->
${salary?string.percent}<br>
<#-- 将浮点型数值转换成指定小数位数输出-->
${salary?string["0.##"]}
<hr>
<h5>字符类型</h5>
${msg}<br>
${msg2}<br>
${msg?substring(0,2)}<br>
${msg?uncap_first}<br>
${msg?cap_first}<br>
${msg?lower_case}<br>
${msg?upper_case}<br>
${msg?length}<br>
${msg?starts_with("he")?c}<br>
${msg?ends_with("vv")?c}<br>
${msg?index_of("h")}<br>
${msg?trim}<br>
${msg?replace("he","haha")}<br>
<hr>
<h5>空值情况</h5>
${str1!}<br>
${str1!"str1 is null !"}<br>
${(str1??)?c}<br>
${str2}<br>
<hr>
<h5>sequence(数据，集合)</h5>
<#list arrays as it>
  下标 ${it?index} --- ${it}<br>
</#list>
获取序列的长度: ${arrays?size}<br>
获取序列第一个元素: ${arrays?first}<br>
获取序列最后一个元素: ${arrays?last}<br>
<hr>
<h5>List操作</h5>
<#list list as it>
    ${it}<br>
</#list>
倒序：<br><#list list?reverse as it>
         &nbsp;&nbsp;&nbsp; ${it}<br>
     </#list>
升序：<br><#list list?sort as it>
        &nbsp;&nbsp;&nbsp; ${it}<br>
      </#list>
降序：<br><#list list?sort?reverse as it>
        &nbsp;&nbsp;&nbsp;${it}<br>
     </#list>
<hr>
<h5>JavaBean集合</h5>
<#list userList?sort_by("username") as user>
    ${user.username} -- ${user.age}<br>
</#list>
<hr>
<h5>map类型</h5>
<#list map?keys as key>
    ${key} -- ${map[key]}
</#list><br>
<#list map?values as value>
    ${value}
</#list>
