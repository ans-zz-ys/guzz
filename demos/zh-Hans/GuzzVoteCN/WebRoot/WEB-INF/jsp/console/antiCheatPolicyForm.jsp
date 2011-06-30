<%@ page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include/tags.jsp" %>

<c:if test="${!policyForm.new}">
	<c:set var="m_policyImpl" value="${policyForm.policy.policyImpl}" />
	<c:set var="m_voteId" value="${policyForm.policy.voteId}" />
</c:if>
<c:if test="${policyForm.new}">
	<c:set var="m_policyImpl" value="${param.p}" />
	<c:set var="m_voteId" value="${param.voteId}" />
</c:if>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>维护反作弊策略</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
  </head>
  
  <body>
   <div id="page">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td valign="top" class="right">
  	<div class="nav">
     	投票管理  &gt;&gt;维护反作弊策略
    </div>
    
    
    <spring:bind path="policyForm.policy.policyImpl">
    	<%@ include file="/WEB-INF/jsp/include/error_inc.jsp" %>
    </spring:bind>
    
    <div class="text">
    	<form method="POST">
    		<input type="hidden" name="id" value="${param.id}" />
    		<input type="hidden" name="voteId" value="${param.voteId}" />
    		
    		<spring:bind path="policyForm.policy.policyImpl">
    		<input type="hidden" name="${status.expression}" value="${m_policyImpl}" />
     		</spring:bind>
    	    	
     		<c:if test="${m_policyImpl eq 'extraProp'}">
     			<g:boundary limit="mustProp=true">
     				<g:list var="m_props" business="voteExtraProperty" limit="voteId=${m_voteId}" orderBy="id asc" pageSize="200" />
     			</g:boundary>
     			
	     		<spring:bind path="policyForm.policy.limitedField">
	     		<div class="cell"><label>限制属性名：</label>
	     			
	     				<select name="${status.expression}" >
	     					<c:forEach items="${m_props}" var="m_prop">
	     						<option value="${m_prop.paramName}" <c:if test="${status.value eq m_prop.paramName}">selected</c:if> >${m_prop.showName}</option>
	     					</c:forEach>
	     				</select>&nbsp;&nbsp;要限制的属性必须为“必填字段”
	     				<%@ include file="/WEB-INF/jsp/include/error_inc.jsp" %>
	     			</div>
	     		</spring:bind>
     		</c:if>
     		
     		<spring:bind path="policyForm.policy.maxLife">
     		<div class="cell"><label>限制时间长度：</label>
     			
     				<input type="text" name="${status.expression}" value="${status.value}" maxlength="11" size="42" />
     				<%@ include file="/WEB-INF/jsp/include/error_inc.jsp" %>&nbsp;单位：秒
     			</div>
     		</spring:bind>
     		
     		<spring:bind path="policyForm.policy.allowedCount">
     		<div class="cell"><label>在限制时间内最多允许投票数：</label>
     			
     				<input type="text" name="${status.expression}" value="${status.value}" maxlength="11" size="42" />
     				<%@ include file="/WEB-INF/jsp/include/error_inc.jsp" %>
     			</div>
     		</spring:bind>
     		     		
     		
     		<div class="botton">
     			<input type="submit" value="提交" class="bot" />
				<input type="reset" value="取消" class="bot"/>
     		  	</div>
     	
     	</form>
    </div>
    </td></tr></table></div>
    
  </body>
</html>
