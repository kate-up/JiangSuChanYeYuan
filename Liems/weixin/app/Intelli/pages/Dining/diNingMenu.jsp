<%--
  Created by IntelliJ IDEA.
  User: liushiqiang
  Date: 2020/6/9
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %>
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %>
<aweto:docType/>
<html>
<head>
    <title><aweto:pageTile/></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <aweto:basePath />
    <base href="${basePath}" />
    <weixin:sessionInfo debug="true"/>
    <aweto:decoration version="2.0" mobile="true"/>
    <script src="weixin/app/Intelli/js/vue.js"></script>
    <script src="weixin/app/Intelli/component/head.js"></script>
    <link rel="stylesheet" href="weixin/app/Intelli/css/component.css">
    <style>
        #dingCanMenu {
            height: 100%;
        }
        .dingCanHead {
            height: 6%;
        }
        .topLeft {
            width: 24%;
            height: 44px;
            font-size: 14px;
            line-height: 44px;
            text-align: center;
            position: absolute;
            right: 0px;
            top: 0px;
        }
        .topSelect {
            width: 100%;
            height: 6%;
            border-bottom: 1px solid #E3E3E3;
            display: flex;
            justify-content: space-around;
        }
        .canPart {
            width: 9%;
            height: 40px;
            font-size: 15px;
            text-align: center;
            line-height: 40px;
        }
        .checkedCan {
            color: #000000;
            border-bottom: 3px solid #3DAA62;
        }
        .CanContent {
            width: 100%;
            height: 80%;
            display: flex;
            background-color: #F2F2F2;
        }
        .con-left {
            width: 20%;
            height: 100%;
            text-align: center;
        }
        .con-right {
            width: 80%;
            height: 100%;
            overflow: scroll;
            background-color: #FFFFFF;
        }
        .con-right::-webkit-scrollbar {
            display:none
        }
        .caiType {
            width: 100%;
            height: 55px;
            color: #000000;
            line-height: 55px;
            font-size: 15px;
        }
        .checkedCaiType {
            background-color: #ffffff;
        }
        .menuTitle {
            width: 97%;
            height: 36px;
            margin-left: 3%;
            line-height: 36px;
            font-size: 15px;
            border-bottom: 1.5px solid #3DAA62;
        }
        .menuList {
            display: flex;
            width: 97%;
            margin: 2% 0 10% 3%;
        }
        .menuImg {
            width: 30%;
        }
        .menuImg img {
            width: 100%;
        }
        .menuInfo {
            width: 40%;
            margin-left: 4%;
            font-size: 15px;
        }
        .caiName {
            height: 30px;
            line-height: 24px;
            color: #000000;
        }
        .caiPrice {
            color: #F54242;
        }
        .menuOpera {
            width: 30%;
            height: 100%;
            display: flex;
            margin-top: 30px;
        }
        .operaDiv {
            width: 24px;
            height: 24px;
            line-height: 24px;
            text-align: center;
            border-radius: 50%;
        }
        .subOpera {
            color: #adabab;
            border: 1px solid #adabab;
            visibility: hidden;
        }
        .opera {
            text-align: center;
            width: 20px;
            line-height: 24px;
            height: 24px;
            font-size: 15px;
            color: #000000;
            visibility: hidden;
        }
        .addOpera {
            font-size: 22px;
            color: #FFFFFF;
            background-color: #3DAA62;
        }
        .dingCan_bar {
            width: 100%;
            height: 8%;
            display: flex;
        }
        .dingCanTotal {
            width: 70%;
            height: 100%;
            display: flex;
            background-color: #333333;
            text-align: center;
        }
        .totalInfo {
            width: 30%;
            display: flex;
        }
        .totalInfoImg {
            line-height: 50px;
            margin-left: 15px;
        }
        .totalInfoImg img {
            width: 28px;
            height: 23px;
        }
        .totalNumber {
            width: 18px;
            height: 18px;
            margin-top: 7px;
            margin-left: -3px;
            text-align: center;
            line-height: 18px;
            font-size: 12px;
            color: #ffffff;
            border-radius: 50%;
            background-color: #3DAA62;
        }
        .totalMoney {
            line-height: 55px;
            font-size: 15px;
            color: #FFFFFF;
        }
        .dingCanConfirm {
            width: 30%;
            height: 100%;
            line-height: 50px;
            text-align: center;
            font-size: 15px;
            color: #ffffff;
            background-color: #3DAA62;
        }
    </style>
</head>
<body :style="{height: screenHeight + 'px'}">
    <div id="dingCanMenu">
        <div class="dingCanHead">
            <head-menu :on-back="back()" :head-menu="title">{{ title }}</head-menu>
            <div class="topLeft">我的订单</div>
        </div>
        <div class="topSelect">
            <div v-for="(item, index) in titleList"
                 :class="{'canPart': true, 'checkedCan': current == index}"
                 @click="checkedCan(index)">{{ item.text }}
            </div>
        </div>
        <div class="CanContent">
            <div class="con-left">
                <div v-for="(item, index) in caiTypeList"
                     :class="{'caiType': true, 'checkedCaiType': type == index}"
                     @click="selectCaiType(index)">{{ item.text }}
                </div>
            </div>
            <div class="con-right">
                <div class="daHunMenu" v-for="(item, index1) in menu" :key="index1" v-show="item.haveData">
                    <div class="menuTitle">{{ item.title }}</div>
                    <div class="menuList" v-for="(item1, index2) in item.list" :key="index2">
                        <div class="menuImg">
                            <img :src= "path + item1.img"/>
                        </div>
                        <div class="menuInfo">
                            <div class="caiName">{{ item1.name }}</div>
                            <div class="caiPrice">
                                ￥ <span>{{ item1.price }}</span>
                            </div>
                        </div>
                        <div class="menuOpera">
                            <div class="operaDiv subOpera" :id="'caiSub' + index1 + index2" @click="AddSubCai(item1.caiNo, item1.price, index1, index2, 'sub')">一</div>
                            <div class="opera" :id="'caiCopies' + index1 + index2">0</div>
                            <div class="operaDiv addOpera" @click="AddSubCai(item1.caiNo, item1.price, index1, index2, 'add')">＋</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="dingCan_bar">
            <div class="dingCanTotal">
                <div class="totalInfo">
                    <div class="totalInfoImg">
                        <img v-if="totalNumber ==0" :src="path + '/Liems/weixin/app/Intelli/img/noSelected.png'"/>
                        <img v-else :src="path + '/Liems/weixin/app/Intelli/img/readySelected.png'"/>
                    </div>
                    <div v-show="totalNumber !=0" class="totalNumber">{{ totalNumber }}</div>
                </div>
                <div class="totalMoney">应付 ￥{{ totalMoney }}</div>
            </div>
            <div class="dingCanConfirm" @click="goConfirmPay">确定</div>
        </div>
    </div>
</body>
<script type="text/javascript">
  var  titleList=[];
  var caiTypeList=[];
  var menu=[];
     //查询页面菜品数据
      aweto.ajax(basePath + "/spm/spmFoodArchives/findAllFoods.ajax", {}, false, function (data) {     
            	if (data.result== "success") {
            		titleList=data.titleList;
            		caiTypeList=data.caiTypeList;
            		menu=data.menu;
               }else{
            	   layer.msg("没有菜品呀~", {icon: 5});//
                   return false;  
               }
             });
  

    new Vue({
        el: "#dingCanMenu",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: '订餐',
            titleList: titleList,
            caiTypeList:caiTypeList,
            current: 0,
            type: 0,
            path: '',
            menu: menu,
            totalNumber: 0,
            totalMoney: 0,
            food_list:[]
        },
        create() {
            this.path = basePath;
        },
        methods: {
            back(){
            },
            goConfirmPay() {
                aweto.ajax(basePath + "/spm/spmFoodArchives/PurchaseFood.ajax", {food_list:this.food_list+""}, false, function (data) {
                	if (data.result== "success") {
                	    //点单成功则跳转付款页面
                        window.location = basePath + "/weixin/app/Intelli/pages/Dining/diNingConfirm.jsp?identify="+data.identify;
                    }else{
                	   layer.msg(data.msg, {icon: 5});//
                       return false;  
                    }
                });
            },
            checkedCan(index) {
                this.current = index;
            },
            selectCaiType(index) {
                this.type = index;
            },
            AddSubCai(caiNo, price, index1, index2, opera) {
                let currentPrice = parseFloat(price);
                let currentTotal = parseFloat(this.totalMoney);
                let number = parseInt($("#caiCopies" + index1 + index2).text());
                if (opera == 'sub') {
                    if (number != 0) {
                        $("#caiCopies" + index1 + index2).text(number - 1);
                        this.totalNumber -= 1;
                        this.totalMoney = (currentTotal - currentPrice).toFixed(2);
                        if (parseInt($("#caiCopies" + index1 + index2).text()) == 0) {
                            $("#caiSub" + index1+ index2).css('visibility', 'hidden');
                            $("#caiCopies" + index1 + index2).css('visibility', 'hidden');
                        }
                    }
                    //若是删除则把数组中菜单主键删除
                    for(var j=0;j<this.food_list.length;j++){
                    	if(this.food_list[j]==caiNo){
                    		this.food_list.splice(j,1);
                    		return false;
                    	}
                    } 
                } else {
                    $("#caiCopies" + index1 + index2).text(number + 1);
                    this.totalNumber += 1;
                    this.totalMoney = (currentTotal + currentPrice).toFixed(2);
                    if (number == 0) {
                        $("#caiSub" + index1 + index2).css('visibility', 'initial');
                        $("#caiCopies" + index1 + index2).css('visibility', 'initial');
                    }
                    this.food_list.push(caiNo);
                }

            }
        }
    })
</script>
</html>
