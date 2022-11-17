<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	public int sum(int a, int b) {
		return a + b;
	}
%>

2 + 1 = <%=sum(2,1) %><br>
3 + 1 = <%=sum(3,1) %><br>
4 + 1 = <%=sum(4,1) %><br>
5 + 1 = <%=sum(5,1) %><br><br>


<%!
	int a = 1;
	public int sum2() {
		a *= 2;
		return a;
	}
%>

2 ^ 1 = <%=sum2() %><br>
2 ^ 2 = <%=sum2() %><br>
2 ^ 3 = <%=sum2() %><br>
2 ^ 4 = <%=sum2() %><br>
2 ^ 5 = <%=sum2() %>

</script>
</body>
</html>