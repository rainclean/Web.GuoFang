<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>个人主页</title>
		<style type="text/css">
			/*设置超链接样式*/
		    a 
		    {
		        color: #5086a5; 
		        text-decoration: none;
		        font-size: 12px;
		    }
		    a:hover 
		    {
		        color: #5086a5; 
		        text-decoration: underline;
		        font-size: 12px;
		    }
		    a:visited 
		    {
		        color: #5086a5;
		        font-size: 12px;
		    }
		    th
		    {
		    	background-color: #D3D3D3;
		    }
		    /*整个tab层居中，宽度为600px*/
		    #tabDiv 
		    {
		        width:600px;
		        margin:1em auto;
		        padding-bottom: 10px;
		        border-right: #b2c9d3 1px solid; 
		        border-top: #b2c9d3 1px solid; 
		        border-left: #b2c9d3 1px solid; 
		        border-bottom: #b2c9d3 1px solid;
		        background: #ffffff;
		    }
		    /*tab头的样式*/
		    #tabsHead 
		    {
		         padding-left: 0px; 
		         height: 26px; 
		         background-color: #e8f7fc;
		         font-size: 1em; 
		         margin: 1px 0px 0px; 
		         color: #5086a5; 
		         line-height: 26px;
		    }
		    /*时间*/
		    #timeShow
		    {
		    	 top: 750px;
		    }
		    /*已选tab头（超链接）的样式*/
		    .curtab 
		    {
		        padding-top: 0px;
		        padding-right: 10px; 
		        padding-bottom: 0px; 
		        padding-left: 10px; 
		        border-right: #b2c9d3 1px solid; 
		        font-weight: bold; 
		        float: left;
		        cursor: pointer; 
		        background: #ffffff; 
		    }
		    /*未选tab头（超链接）的样式*/
		    .tabs 
		    {
		        border-right: #c1d8e0 1px solid; 
		        padding-top: 0px;
		        padding-right: 10px; 
		        padding-bottom: 0px; 
		        padding-left: 10px; 
		        font-weight: normal; 
		        float: left;
		        cursor: pointer; 
		    }
		    p
		    {
		        font-size:9pt;
		        margin-left:20pt;
		    }
		</style>
		<script type="text/javascript">
			//显示tab（tabHeadId：tab头中当前的超链接；tabContentId要显示的层ID）
	        function showTab(tabHeadId,tabContentId) 
	        {
	            //tab层
	            var tabDiv = document.getElementById("tabDiv");
	            //将tab层中所有的内容层设为不可见
	            //遍历tab层下的所有子节点
	            var taContents = tabDiv.childNodes;
	            for(i=0; i<taContents.length; i++) 
	            {
	                //将所有内容层都设为不可见
	                if(taContents[i].id!=null && taContents[i].id != 'tabsHead')
	                {
	                    taContents[i].style.display = 'none';
	                }
	            }
	            //将要显示的层设为可见
	            document.getElementById(tabContentId).style.display = 'block';          
	            //遍历tab头中所有的超链接
	            var tabHeads = document.getElementById('tabsHead').getElementsByTagName('a');
	            for(i=0; i<tabHeads.length; i++) 
	            { 
	                //将超链接的样式设为未选的tab头样式
	                tabHeads[i].className='tabs'; 
	            }
	            //将当前超链接的样式设为已选tab头样式
	            document.getElementById(tabHeadId).className='curtab';
	            document.getElementById(tabHeadId).blur();
	        }
	    	function showTime() 
			{
				today = new Date();
				
				var day; var date;
				if(today.getDay()==0) day = " 星期日"
				if(today.getDay()==1) day = " 星期一"
				if(today.getDay()==2) day = " 星期二"
				if(today.getDay()==3) day = " 星期三"
				if(today.getDay()==4) day = " 星期四"
				if(today.getDay()==5) day = " 星期五"
				if(today.getDay()==6) day = " 星期六"
				document.fgColor = "000000";
				date = "今天是：" + (today.getMonth() + 1 ) + "月" + today.getDate() + "日" + day + " ";
				
				var hours = today.getHours();
				var minutes = today.getMinutes();
				var seconds = today.getSeconds();
				var timer = "" + ((hours > 12) ? hours-12 : hours);
				timer += ((minutes < 10) ? ":0" : ":") + minutes;
				timer += ((seconds < 10) ? ":0" : ":") + seconds;
				timer += " " + ((hours > 12) ? "pm" : "am");
				date += timer;
				document.clock.show.value = date;
				setTimeout("showTime()",1000);
			}
		</script>
	</head>
	<body onload="showTime()">
		<div style="width: 100%; font-family: 微软雅黑; text-align: center">
	        个人主页</div>
	
	    <div id="tabDiv" style="width: 1000px">
	
	        <div id="tabsHead">
	            <a id="tabs1" class="curtab" href="javascript:showTab('tabs1','tabContent1')">基本资料</a>
	            <a id="tabs2" class="tabs" href="javascript:showTab('tabs2','tabContent2')">学习经历</a>
	            <a id="tabs3" class="tabs" href="javascript:showTab('tabs3','tabContent3')">所得奖励</a>
	            <a id="tabs4" class="tabs" href="javascript:showTab('tabs4','tabContent4')">最新动态</a>
	            <a id="tabs5" class="tabs" href="javascript:showTab('tabs5','tabContent5')">相关链接</a>
	        </div>
	
	        <div id="tabContent1" style="display: block">
	            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
	                <tr>
	                    <td rowspan="3" style="width: 300px">
	                       	<a id="a">
	                        	<img alt="刘立伟" src="images/3.jpg" height="371" width="295" border="3"/>
	               			</a>
	                    </td>
	                    <td colspan="3" rowspan="3">
	                        <table border="1" cellpadding="0" cellspacing="0" style="border-left-color: aqua;
	                            border-bottom-color: aqua; width: 700px; border-top-style: solid; border-top-color: aqua;
	                            border-right-style: solid; border-left-style: solid; height: 380px; border-right-color: aqua;
	                            border-bottom-style: solid">
	                            <tr>
	                                <td style="width: 50%">
	                                    姓名：刘立伟</td>
	                                <td style="width: 50%">
	                                    生日：1996.9.20</td>
	                            </tr>
	                            <tr>
	                                <td style="width: 50%">
	                                    祖籍：河北石家庄</td>
	                                <td style="width: 50%">
	                                    出生地：石家庄鹿泉</td>
	                            </tr>
	                            <tr>
	                                <td style="width: 50%; height: 29px">
	                                    身高：174cm</td>
	                                <td style="width: 50%; height: 29px">
	                                    体重：63kg</td>
	                            </tr>
	                            <tr>
	                                <td style="width: 50%">
	                                    血型：B</td>
	                                <td style="width: 50%">
	                                    星座：双子座</td>
	                            </tr>
	                            <tr>
	                                <td colspan="2">
	                                    简介：<b>刘立伟</b>是香港著名歌手、演员，香港非官守太平绅士衔，中国残疾人福利基金会副理事长。他曾获香港特别行政区荣誉勋章，是大中华地区乐坛和影坛巨星。刘德华是华人娱乐圈影、视、歌多栖发展的代表之一，在华人社会享有很高的声望。作为歌手，他是香港乐坛“四大天王”之一，吉尼斯世界纪录大全中获奖最多的香港歌手，作为演员，他曾凭借《暗战》和《大只佬》获得两届香港电影金像奖最佳男主角，以《无间道3终极无间》和《桃姐》荣获两届台湾金马奖最佳男主角，参与演出的电影已经超过140部。
	                                </td>
	                            </tr>
	                        </table>
	                    </td>
	                </tr>
	                <tr>
	                </tr>
	                <tr>
	                </tr>
	            </table>
	        </div>
	        <!--以下为学习经历部分内容-->
	        <div id="tabContent2" style="display: none">
	            <ul>
	                <li>寺家庄小学6年</li>
	                <li>镇中3年</li>
	                <li>鹿泉一中3年</li>
	                <li>石家庄铁道大学1年半<b>（在读）</b></li>
	            </ul>
	        </div>
	        <!-- 以下为所得奖励部分内容 -->
	        <div id="tabContent3" style="display:none">
	        	<ul>
	        		<li>全国高校Linux竞赛优秀奖</li>
	        		<li>中国十大杰出青年</li>
	        		<li>其他</li>
	        	</ul>
	        </div>
	        <!-- 以下为最新动态部分内容 -->
	        <div id="tabContent4" style="display: none">
	        	<table border=1 style="width: 100%">
	        		<tr>
	        			<th align="center" style="width: 50%"><b><font size=5>时间</font></b></th>
	        			<th align="center" style="width: 50%"><b><font size=5>事件</font></b></th>
	        		</tr>
	        		<tr bgcolor="#EAEAEA">
	        			<td align="center" style="width: 50%">2016.12.15</td>
	        			<td align="center" style="width: 50%">参加国家一等教育</td>
	        		</tr>
	        		<tr bgcolor="#EAEAEA">
	        			<td align="center" style="width: 50%">2017.1.1</td>
	        			<td align="center" style="width: 50%">欢度元宵</td>
	        		</tr>
	        	</table>
	        </div>
	        <!-- 相关链接 -->
	        <div id="tabContent5" style="display: none">
	        	<ul>
	        		<li><a href="http://www.cnblogs.com/lxmwb">博客园主页</a></li>
	        		<li><a href="http://cnsimo.cn">自建网站</a></li>
	        	</ul>
	        </div>
	    </div>
	    <div style="text-align: center">
	    	<form name="clock" onsubmit="0"><input name="show" type="text" size="35" style="text-align: center; background-color: lightyellow; border-width:3;" readonly></form>
	    </div>
	    
	    <script type="text/javascript">
		    var img = new Array(7);
		 
	    	var nums = 0;
	    	if(document.images) {
	    		for(i = 1;i <= 7; i++) {
	    			img[i] = new Image();
	    			img[i].src = "images/"+i+".jpg";
	    			
	    		}
	    	}
	    	function fort() {
	    		nums ++;
	    		document.getElementById('a').href = "images/"+nums+".jpg";
	    		document.images[0].src = img[nums].src;
	    		
	    		if(nums == 7)
	    			nums = 0;
	    	}
	    	function slide() {
	    		setInterval("fort()",1000);
	    	}
	    	slide();
	    </script>
	</body>
</html>