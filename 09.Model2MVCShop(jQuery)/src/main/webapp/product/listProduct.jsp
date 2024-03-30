<!-- ��ǰ�����ȸ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jQuery-2.1.4.min.js"></script>
<script type="text/javascript">
	function fncGetList(currentPage){
			
	        $("#currentPage").val(currentPage)
	        $("form").attr("method","POST").attr("action","/product/listProduct").submit();
	    }
	    
	   $(function() {
			
		   $( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
				fncGetList(1);
			});
		   var menu = '${menu}';
		   
			$( 	".ct_list_pop td:nth-child(3) > a ").css("color" , "red");
			$( 	".ct_list_pop td:nth-child(3) > a ").css("cursor" , "pointer");
			$("h7").css("color" , "red");
			
		   $( ".ct_list_pop td:nth-child(3) > a").on("click" , function() 
			{
			   	if(menu=='manage')
			   	{
			   			self.location ="/product/updateProduct?prodNo="+$(this).parent().children('input').val()+"&menu="+menu;
			   	}else
			   		{
			   			self.location ="/product/getProduct?prodNo="+$(this).parent().children('input').val()+"$menu="+menu;
			   		}
		});
	});


</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm" action="/product/listProduct?menu=${menu}"
			method="post">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37" /></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">
							<c:set var="title" value="${menu eq 'manage' ? '��ǰ����' : '��ǰ �����ȸ'}" />
							${title}
							</td>
						</tr>
					</table>
							</td>
						<td width="12" height="37">
							<img src="/images/ct_ttl_img03.gif"		width="12" height="37" />
						</td>
				</tr>
			</table>

			<<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
			    <tr>
			        <td align="right">
			            <c:if test="${not empty search.searchCondition}">
			                <select name="searchCondition" class="ct_input_g" style="width: 80px">
			                    <option value="1" ${search.searchCondition eq '1' ? 'selected' : ''}>��ǰ��</option>
			                    <option value="2" ${search.searchCondition eq '2' ? 'selected' : ''}>��ǰ����</option>
			                </select>
			                <input type="text" name="searchKeyword" value="${search.searchKeyword}" class="ct_input_g" style="width: 200px; height: 19px">
			            </c:if>
			            <c:if test="${empty search.searchCondition}">
			                <select name="searchCondition" class="ct_input_g" style="width: 80px">
			                    <option value="1">��ǰ��</option>
			                    <option value="2">��ǰ����</option>
			                </select>
			                <input type="text" name="searchKeyword" class="ct_input_g" style="width: 200px; height: 19px">
			            </c:if>
			        </td>
			        <td align="right" width="70">
			            <table border="0" cellspacing="0" cellpadding="0">
			                <tr>
			                    <td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23"></td>
			                    <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
<!-- 			                        <a href="javascript:fncGetList('1');"> -->		<a>�˻�</a>
	                    </td>
			                    <td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23"></td>
			                </tr>
			            </table>
			        </td>
			    </tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
				<tr>
					<td colspan="11">
							��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������
					</td>
				</tr>

				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">��ǰ��</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�������</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				

			<c:set var="i" value="0" /> <!-- i ���� �ʱ�ȭ -->
			<c:forEach var="product" items="${list }"> <!-- list�� �� ��ҿ� ���� �ݺ� -->
			    <c:set var="i" value="${i+1 }"/> <!-- i ���� 1 ������Ŵ -->
				<tr class="ct_list_pop">
					<td align="center">${ i }</td>
					<td></td>
					<td align="left">
						<a>${product.prodName}</a>
						<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}"/>
						</td>
					<td></td>
					<td align="left">${product.price}</td>
					<td></td>
					<td align="left">${product.regDate}</td>
					<td></td>
					<td align="left">
							�Ǹ���
					</td>
					</tr>
					<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
			</c:forEach>
		</table>

			
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
			 <tr>
               <td align="center">
               
				<jsp:include page="../common/pageNavigator.jsp"/>	
               </td> 
            </tr>
			<!--  ������ Navigator �� -->
			
			
		</form>

	</div>
</body>
</html>