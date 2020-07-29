<#-- 通过 import指令引入命名空间 -->
<#import "commons.ftl" as commons>
<#-- 使用公共定义的宏 -->
<@commons.cfb2 num=5></@commons.cfb2>

<hr>
<#-- 包含指令（引入其他页面文件） include-->
<#include "test.html">
<hr>
<#include "hello.txt">
<hr>
<#include "f01.ftl">
