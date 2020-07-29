<#-- 定义通用公共的宏 -->
<#macro cfb2 num>
    <#list 1..num as i>
        <#list 1..i as j>
            ${j} * ${i} = ${j * i} &nbsp;
        </#list>
        <br>
    </#list>
</#macro>