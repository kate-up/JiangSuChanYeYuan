<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %>
<%@ taglib prefix="wf"  uri="http://wwww.aweto-framework.org/taglibs/workflowTag" %>
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %>
<aweto:docType/>
<html>
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
    <script src="weixin/app/Intelli/js/index.js"></script>
    <script src="weixin/app/Intelli/js/utill.js"></script>
    <script src="weixin/app/Intelli/js/player.js"></script>

    <link rel="stylesheet" href="weixin/app/Intelli/css/index.css">
    <link rel="stylesheet" href="weixin/app/Intelli/css/component.css">
    <script type="text/javascript" src="aweto/ui/core/template/detailTemplate-2.0.js"></script>
    <style>
        .gray-bg {
            margin: 0;
            padding: 0;
            background: #1d1d1d;
        }
        .music-player {
            position: relative;
            margin: 0px auto;
            width: 100%;
            height: 100%;
        }
        .music-player__main {
            height: calc(100% - 40px);
            padding: 25px;
            -webkit-box-shadow: 0 0 40px rgba(0, 0, 0, 0.8);
            box-shadow: 0 0 40px rgba(0, 0, 0, 0.8);
            border-radius: 10px;
            position: relative;
            overflow: hidden;
        }
        .music-player__blur {
            width: 100%;
            height: 100%;
            position: absolute;
            background: url("weixin/app/Intelli/img/dlj.png") no-repeat center;
            background-size: 100%;
            left: 0;
            top: 0;
            z-index: -1;
            -webkit-filter: blur(20px);
            filter: blur(20px);
        }
        .music-player__disc {
            width: 130px;
            height: 130px;
            background: url("weixin/app/Intelli/img/changpianji.png") no-repeat center;
            background-size: 100%;
            position: relative;
        }
        .music-player__image {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            position: absolute;
            overflow: hidden;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            margin: auto;
        }
        .music-player__pointer {
            width: 25px;
            position: absolute;
            right: -10px;
            top: 0;
            -webkit-transform-origin: right top;
            -ms-transform-origin: right top;
            transform-origin: right top;
            -webkit-transform: rotate(-15deg);
            -ms-transform: rotate(-15deg);
            transform: rotate(-15deg);
            -webkit-transition: all 0.3s;
            -o-transition: all 0.3s;
            transition: all 0.3s;
        }
        .music-player__controls {
            width: 330px;
            height: 130px;
        }
        .music__info {
            width: 100%;
            height: 50px;
            margin-bottom: 15px;
        }
        .music__info .music__info--title {
            font-size: 16px;
        }
        .music__info .music__info--title, .music__info .music__info--singer {
            color: #fff;
        }
        .music__info .music__info--singer {
            color: #ccc;
            font-size: 14px;
            margin-top: 10px;
        }
        .player-control {
            width: 100%;
        }
        .player-control__content {
            margin-bottom: 5px;
            overflow: hidden;
        }
        .player-control__btns {
            float: left;
            overflow: hidden;
        }
        .player-control__btn {
            float: left;
            margin: 0 5px;
            font-weight: bolder;
            color: #fff;
            cursor: pointer;
        }
        .player-control__volume {
            float: right;
            overflow: hidden;
        }
        .iconfont {
            font-family: "iconfont" !important;
            font-size: 16px;
            font-style: normal;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
        .icon-volume:before {
            content: "\e87a";
        }
        .progress {
            background: rgba(0, 0, 0, 0.3);
            height: 5px;
            -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.5) inset;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.5) inset;
            overflow: hidden;
            border-radius: 2px;
            position: relative;
            cursor: pointer;
        }
        .control__volume--progress {
            float: left;
            width: 100px;
            position: relative;
            top: 8px;
        }
        .player-control__content {
            margin-bottom: 5px;
            overflow: hidden;
        }
        .player__song--progress {
            width: 100%;
            margin-top: 15px;
        }
        .nowTime {
            float: left;
        }
        .player__song--timeProgess {
            font-size: 12px;
            color: #fff;
            margin-top: 5px;
            padding: 0px 3px;
            background: rgba(0, 0, 0, 0.3);
            border-radius: 5px;
        }
        .totalTime {
            float: right;
        }
    </style>
</head>
<body class="gray-bg" :style="{height: screenHeight + 'px'}" style="overflow: hidden;">
    <div id="app" style="height: 100%">
        <head-menu :head-menu="title">{{title}}</head-menu>
        <div class="music-player">
            <audio class="music-player__audio" ></audio>
            <!-- 播放器主体 -->
            <div class="music-player__main">
                <!-- 模糊背景 -->
                <div class="music-player__blur"></div>
                <!-- 唱片 -->
                <div class="music-player__disc">
                    <!-- 唱片图片 -->
                    <div class="music-player__image">
                        <img width="100%" src="weixin/app/Intelli/img/dlj.png" alt="">
                    </div>
                    <!-- 指针 -->
                    <div class="music-player__pointer"><img width="100%" src="weixin/app/Intelli/img/cd_tou.png" alt=""></div>
                </div>
                <!-- 控件主体 -->
                <div class="music-player__controls">
                    <!-- 歌曲信息 -->
                    <div class="music__info">
                        <h3 class="music__info--title">...</h3>
                        <p class="music__info--singer">...</p>
                    </div>
                    <!-- 控件... -->
                    <div class="player-control">
                        <div class="player-control__content">
                            <div class="player-control__btns">
                                <div class="player-control__btn player-control__btn--prev"><i class="iconfont icon-prev"></i></div>
                                <div class="player-control__btn player-control__btn--play"><i class="iconfont icon-play"></i></div>
                                <div class="player-control__btn player-control__btn--next"><i class="iconfont icon-next"></i></div>
                                <div class="player-control__btn player-control__btn--mode"><i class="iconfont icon-loop"></i></div>
                            </div>
                            <div class="player-control__volume">
                                <div class="control__volume--icon player-control__btn"><i class="iconfont icon-volume"></i></div>
                                <div class="control__volume--progress progress"></div>
                            </div>
                        </div>
                        <!-- 歌曲播放进度 -->
                        <div class="player-control__content">
                            <div class="player__song--progress progress"></div>
                            <div class="player__song--timeProgess nowTime">00:00</div>
                            <div class="player__song--timeProgess totalTime">00:00</div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 歌曲列表 -->
            <div class="music-player__list">
                <ul class="music__list_content">
                    <!-- <li class="music__list__item play">123</li>
                    <li class="music__list__item">123</li>
                    <li class="music__list__item">123</li> -->
                </ul>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
    new Vue({
        el: "#app",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "音乐播放",
        },
        methods: {

        }
    })
</script>
</html>

