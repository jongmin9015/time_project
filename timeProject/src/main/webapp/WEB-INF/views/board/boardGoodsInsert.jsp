<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/326f61a68e.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="/resources/js/javascript.js" defer></script>
    <title>등록</title>
</head>
<body>
	<div id="header">
   		<%@ include file="../includes/header.jsp"  %>
    </div>
    <div id="warp">
        <div class="noticeView_inner">
	            <div class="noticeView_tit_div">
	                <h2 class="noticeView_tit">
	                    상품 등록                    
	                </h2>
	            </div>
            <form method="post" id="boardGoodsInsertFrm" enctype="mutipart/form-data">
                <div class="noticeView_table_inner">
                    <table class="noticeView_table">
                        <tr>
                            <th scope="row" style="border: none;">상품명</th>
                            <td>
                            	<input type="text" name="goodsName" class="noticeWrite_inp noticeWrite_inp_title">                            	
                            	<select name="goodsCategory">
                            		<option value="diet">diet</option>
                            		<option value="pastanoodle">pastanoodle</option>
                            		<option value="saladchicken">saladchicken</option>
                            		<option value="lunchbox">lunchbox</option>
                            		<option value="pasta">pasta</option>
                            		<option value="snack">snack</option>
                            		<option value="poached">poached</option>
                            		<option value="soup">soup</option>
                            	</select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">내용</th>
                           	<td><input type="text" name="goodsContent" class="noticeWrite_inp noticeWrite_inp_writer"></td>
                        </tr>                        
                        <tr>
                            <th scope="row">가격</th>
                           	<td><input type="number" name="goodsPrice" class="noticeWrite_inp noticeWrite_inp_writer"></td>
                        </tr>                        
                        <tr>
                            <th scope="row">상품단위</th>
                           	<td><input type="text" name="goodsUnit" class="noticeWrite_inp noticeWrite_inp_writer"></td>
                        </tr>                        
                        <tr>
                            <th scope="row">상품용량</th>
                           	<td><input type="text" name="goodsWeight" class="noticeWrite_inp noticeWrite_inp_writer"></td>
                        </tr>                        
                        <tr>
                            <th scope="row">배송</th>
                           	<td><input type="text" name="goodsDelivery" class="noticeWrite_inp noticeWrite_inp_writer"></td>
                        </tr>                        
                        <tr>
                            <th scope="row">상품포장용기</th>
                           	<td><input type="text" name="goodsPackage" class="noticeWrite_inp noticeWrite_inp_writer"></td>
                        </tr>                        
                        <tr>
                            <th scope="row">상품부가설명</th>
                           	<td><input type="text" name="goodsAllergy" class="noticeWrite_inp noticeWrite_inp_writer"></td>
                        </tr>                        
                        <tr>
                            <th scope="row">상품 이미지</th>
                           	<td>
                           		<input type="file" name="goodsImage" id="goodsImg" multiple class="noticeWrite_inp noticeWrite_inp_writer">
                           		<div class="goodsImg_div">
                           			<img src="">
                           		</div>                           		
                           	</td>
                        </tr>
                    </table>
                    <div class="noticeView_listBtn_div clear">
                    	<input type="hidden" name="bgno" value="${bgno }">
                        <button type="submit" class="noticeWrite_submitBtn">등록</button>
                        <a href="javascript:history.back()" class="noticeWrite_backBtn">이전</a>
                    </div>                    
                </div>
            </form>
        </div>
    </div>
    <div id="footer">
   		<%@ include file="../includes/footer.jsp"  %>
    </div>
    <script>
    $("#goodsImg").change(function(){
    	if(this.files && this.files[0]) {
    	    var reader = new FileReader;
    	    reader.onload = function(data) {
    	     $(".goodsImg_div img").attr("src", data.target.result).width(500);        
    	    }
    	    reader.readAsDataURL(this.files[0]);
    	}
   	});
    </script>
</body>
</html>