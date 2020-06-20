<%--
  Created by IntelliJ IDEA.
  User: licaihong
  Date: 2020/6/4
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %>
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title><aweto:pageTile/></title>
    <!-- 设置文档编码 -->
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <aweto:basePath />
    <base href="${basePath}" />
    <weixin:sessionInfo debug="true"/>
    <aweto:decoration version="2.0" mobile="true"/>
    <aweto:entityInfo name="org.aweto.web.entity.WebEmpCertify"/>
    <script type="text/javascript" src="aweto/ui/core/template/detailTemplate-2.0.js?v=20200217"></script>
    <script src="weixin/app/Intelli/js/vue.js"></script>
    <script src="weixin/app/Intelli/component/head.js"></script>
    <script src="weixin/app/Intelli/component/ulList.js"></script>
    <script src="weixin/app/Intelli/component/table.js"></script>
    <link rel="stylesheet" href="weixin/app/Intelli/css/component.css">
    <title>研发中心月度例会会议记录</title>
    <style type="text/css">
        body {
            padding: 0 !important;
            margin: 0 !important;
            box-sizing: border-box !important;
        }
        .green_tit{
            font-size: 17px;
            color: #3daa62;
            padding-left: 10px;
            border-left: 5px solid #3daa62;
            margin-bottom: 12px;
        }
    </style>

</head>
<body>
    <div id="meetingRepot" :style="{height: screenHeight + 'px'}" style="background: #f7f7f8;padding-top: 1px;overflow: hidden">
        <head-menu :head-menu="title">{{title}}</head-menu>
        <ul-lists :meet-list = "meetList"></ul-lists>
        <div class="shell">
            <div class="green_tit">会议记录</div>
<%--            <table class="tableWidth">--%>
<%--                <thead v-if="tableHead">--%>
<%--                    <tr>--%>
<%--                        <td v-for="(item, index) in tableHead">{{item}}</td>--%>
<%--                    </tr>--%>
<%--                </thead>--%>
<%--                <tbody>--%>
<%--                <tr v-for="(item, index) in tableBody">--%>
<%--                    <td>{{item.workCont}}</td>--%>
<%--                    <td>{{item.resper}}</td>--%>
<%--                    <td>{{item.date}}</td>--%>
<%--                    <td>{{item.isFinish}}</td>--%>
<%--                </tr>--%>
<%--                </tbody>--%>
<%--            </table>--%>
            <table-list :table-head="tableHead" :table-body="tableBody"></table-list>
        </div>
    </div>
</body>
<script type="text/javascript">
    new Vue({
        el: "#meetingRepot",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "研发中心月度例会会议记录",
            meetList: [
                {title: "会议主题", cont: "xxxxx"},
                {title: "会议编号", cont: "AS2421543"},
                {title: "会议时间", cont: "2020-05-20 12:00"},
                {title: "会议类型", cont: "xxx"},
                {title: "会议地点", cont: "xxx"},
                {title: "主持人", cont: "张峰"},
                {title: "所属项目", cont: "xxx"},
                {title: "参会人员", cont: "张峰"},
                {title: "缺席人员", cont: "张峰"}
            ],
            tableHead: ["工作内容", "责任人", "日期", "是否完成"],
            tableBody: [
                {workCont: "xxx", resper: "张峰", date: "2020-05-12", isFinish: "否"},
                {workCont: "xxx", resper: "晚霞", date: "2020-05-12", isFinish: "是"},
                {workCont: "xxx", resper: "朝阳", date: "2020-05-12", isFinish: "是"}
            ]
        }
    })
</script>
</html>
