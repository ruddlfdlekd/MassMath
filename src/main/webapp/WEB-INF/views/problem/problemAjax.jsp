<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<c:forEach begin="0" end="${data.size()}" var="i" items="${data}" varStatus="index">
<c:if test="${index.index % 2 eq 0 }">
	${i}
</c:if>
	<c:if test="${index.index % 2 eq 1}">
<img src="http://latex.codecogs.com/gif.latex?${i}"/>
	</c:if>

</c:forEach>
</div>

</body>


