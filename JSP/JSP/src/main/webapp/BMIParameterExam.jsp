<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

double cm = Integer.parseInt(request.getParameter("cm"));
double kg = Integer.parseInt(request.getParameter("kg"));
double bmi = kg / ((cm * 0.01) * (cm * 0.01));
%>
입력한 키는 <%=cm %> 이고 <br>
입력한 몸무게는 <%=kg %> 이므로 <br>
당신의 bmi수치는 <%=String.format("%.3f",bmi) %>이며 <br>
결과는 
<%
	if(bmi <= 18.4) {
		out.println("저체중 입니다. <br>");
		out.println("<img src='http://kormedi.com/wp-content/uploads/2018/11/shutterstock_244143904-580x384.jpg'>");
	} else if (bmi <= 22.9) {
		out.println("정상체중 입니다. <br>");
		out.println("<img src='https://health.chosun.com/site/data/img_dir/2021/03/08/2021030801022_0.jpg'>");
	} else if (bmi <= 24.9) {
		out.println("과체중 입니다. <br>");
		out.println("<img src='https://s3.ap-northeast-2.amazonaws.com/img.kormedi.com/news/article/__icsFiles/artimage/2017/03/09/c_km601/459121_540.jpg'>");
	} else if (bmi <= 29.9) {
		out.println("비만 입니다. <br>");
		out.println("<img src='https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202208/31/eca47bcc-f853-4ccc-8d74-b21c3f19a25c.jpg'>");
	} else {
		out.println("고도비만 입니다. <br>");
		out.println("<img src='https://s3.ap-northeast-2.amazonaws.com/img.kormedi.com/news/culture/diet/__icsFiles/artimage/2013/07/02/c_km60712/459141_570_1.jpg'>");
	}
%>

</body>
</html>