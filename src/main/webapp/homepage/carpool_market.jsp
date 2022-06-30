<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>carpool_market</title>
    <style>
      #container {
        width: 1080px;
        margin: 0px auto;
        padding: 20px;
        border: 1px solid #bcbcbc;
      }
      #carpool-left {
        width: 300px;
        height: 350px;
        padding: 20px;
        margin-top: 40px;
        margin-left: 130px;
        margin-bottom: 30px;
        float: left;
        border: 1px solid #bcbcbc;
        box-shadow: 3px 3px 3px gray;
        border-radius: 10px 10px;
      }
       #carpool-left1 {
        width: 216px;
        height: 30px;
        padding: 5px;
        float: left;
        border: 1px solid #bcbcbc;
      }
      #carpool-left2 {
        width: 50px;
        height: 30px;
        padding: 5px;
        margin-left: 10px;
        float: left;
        border: 1px solid #bcbcbc;
      }
       #carpool-left3 {
        width: 290px;
        height: 290px;
        padding: 5px;
        margin-top: 10px;
        float: left;
        border: 1px solid #bcbcbc;
      }
      #carpool-table-mini {
        width: 270px;
        height: 20px;
        padding: 5px;
        margin-top: 10px;
        margin-left: 5px;
        float: left;
        border: 1px solid #bcbcbc;
        font-size: 10px;
        text-align: right;
      }
      #market-right {
        width: 300px;
        height: 350px;
        padding: 20px;
        margin-top: 40px;
        margin-right: 130px;
        margin-bottom: 30px;
        float: right;
        border: 1px solid #bcbcbc;
        box-shadow: 3px 3px 3px gray;
        border-radius: 10px 10px;
      }
      #market-right1 {
        width: 216px;
        height: 30px;
        padding: 5px;
        float: left;
        border: 1px solid #bcbcbc;
      }
      #market-right2 {
        width: 50px;
        height: 30px;
        padding: 5px;
        margin-left: 10px;
        float: left;
        border: 1px solid #bcbcbc;
      }
       #market-right3 {
        width: 290px;
        height: 290px;
        padding: 5px;
        margin-top: 10px;
        float: left;
        border: 1px solid #bcbcbc;
      }
      #market-table-mini {
        width: 270px;
        height: 20px;
        padding: 5px;
        margin-top: 10px;
        margin-left: 5px;
        float: left;
        border: 1px solid #bcbcbc;
        font-size: 10px;
        text-align: right;
      }
      #weather {
        clear: both;
        padding: 20px;
        border: 1px solid #bcbcbc;
      }
    </style>
  </head>
  <body>
    <div id="container">
      <div id="carpool-left">
      	<div id="carpool-left1" style="text-align:center; font-weight:bold; font-size: 25px" >
        <span>CARPOOL</span>
        </div>
        <div id="carpool-left2" style="text-align:right; font-size: 10px" >
        <span></span><br>
        <span>+더보기</span>
        </div>
        <div id="carpool-left3">
       <c:forEach begin="1" end="7">
        <div id="carpool-table-mini">
         <table>
         	<tr>
         		<td style="width: 80px">게시물 이름</td>
         		<td>조회수</td>
         		<td>게시날짜</td>
         		<td>작성자</td>
         		<td>♥</td>
         		<td>좋아요수</td>
         	</tr>
         </table>
         </div>
         </c:forEach>
        </div>
      </div>
      <div id="market-right">
        <div id="market-right1" style="text-align:center; font-weight:bold; font-size: 25px">
        <span>MARKET</span>
        </div>
         <div id="market-right2" style="text-align:right; font-size: 10px" >
        <span></span><br>
        <span>+더보기</span>
        </div>
        <div id="market-right3">
        <c:forEach begin="1" end="7">
        <div id="market-table-mini">
         <table>
         	<tr>
         		<td style="width: 80px">게시물 이름</td>
         		<td>조회수</td>
         		<td>게시날짜</td>
         		<td>작성자</td>
         		<td>♥</td>
         		<td>좋아요수</td>
         	</tr>
         </table>
         </div>
         </c:forEach>
        </div>
      </div>
      <div id="weather">
      
        <iframe width="100%" height="110px"
		src="https://indify.co/widgets/live/weather/IPxU1S1y9VdqZC9NSsg2"
		frameborder="0" onclick="location.href='https://www.weather.go.kr/w/weather/forecast/short-term.do'"></iframe>
		
      </div>
      
    </div>
    <%@include file ="footer.jsp" %>
  </body>
</html>