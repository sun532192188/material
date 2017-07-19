<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/commons.jsp" %>
<%
	String url = request.getParameter("url");
%>
<div class="pagin">
  	<div class="message"><i class="blue">${pages.total}</i>条记录，第&nbsp;<i class="blue">${pages.currentPage}&nbsp;</i>页,共&nbsp;<i class="blue">${pages.totalPage}&nbsp;</i>页,每页显示&nbsp;<i class="blue">${pages.size}&nbsp;</i>条</div>
  	<c:if test="${pages.totalPage gt 1}">
  	<ul class="paginList">
       <c:if test="${pages.currentPage gt 1}">
           <li class="paginItem"><a href="<%=url%>&page=${pages.currentPage-1}"><span class="pagepre"></span></a></li>
   		<li class="paginItem"><a href="<%=url%>&page=1">首页</a></li>
       </c:if>
       <c:choose>
           <c:when test="${pages.totalPage lt 11}">
               <c:forEach var="i" begin="1" end="${pages.totalPage}" step="1">
                   <c:choose>
                       <c:when test="${pages.currentPage eq i}">
                           <li class="paginItem current"><a href="javascript:;">${i}</a></li>
                       </c:when>
                       <c:otherwise>
                           <li class="paginItem"><a href="<%=url%>&page=${i}">${i}</a></li>
                       </c:otherwise>
                   </c:choose>
               </c:forEach>
           </c:when>
           <c:otherwise>
               <c:choose>
                   <c:when test="${pages.currentPage lt 6}">
                       <c:forEach var="i" begin="1" end="11" step="1">
                           <c:choose>
                               <c:when test="${pages.currentPage eq i}">
                                  <li class="paginItem current"><a href="javascript:;">${i}</a></li>
                               </c:when>
                               <c:otherwise>
                                   <li class="paginItem"><a href="<%=url%>&page=${i}">${i}</a></li>
                               </c:otherwise>
                           </c:choose>
                       </c:forEach>
                   </c:when>
                   <c:otherwise>
                       <c:choose>
                           <c:when test="${pages.totalPage-pages.currentPage lt 5}">
                               <c:forEach var="i" begin="${pages.totalPage-10}" end="${pages.totalPage}" step="1">
                                   <c:choose>
                                       <c:when test="${pages.currentPage eq i}">
                                           <li class="paginItem current"><a href="javascript:;">${i}</a></li>
                                       </c:when>
                                       <c:otherwise>
                                           <li class="paginItem"><a href="<%=url%>&page=${i}">${i}</a></li>
                                       </c:otherwise>
                                   </c:choose>
                               </c:forEach>
                           </c:when>
                           <c:otherwise>
                               <c:forEach var="i" begin="${pages.currentPage-5}" end="${pages.currentPage+5}" step="1">
                                   <c:choose>
                                       <c:when test="${pages.currentPage eq i}">
                                           <li class="paginItem current"><a href="javascript:;">${i}</a></li>
                                       </c:when>
                                       <c:otherwise>
                                           <li class="paginItem"><a href="<%=url%>&page=${i}">${i}</a></li>
                                       </c:otherwise>
                                   </c:choose>
                               </c:forEach>
                           </c:otherwise>
                       </c:choose>
                   </c:otherwise>
               </c:choose>
           </c:otherwise>
       </c:choose>
       <c:if test="${pages.currentPage lt pages.totalPage}">
	   		<li class="paginItem"><a href="<%=url%>&page=${pages.totalPage}">尾页</a></li>
	        <li class="paginItem"><a href="<%=url%>&page=${pages.currentPage+1}"><span class="pagenxt"></span></a></li>
       </c:if>
   	</ul>
   	</c:if>
</div>