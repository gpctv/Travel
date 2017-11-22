<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resource/css/bootstrap.min.css" rel="stylesheet" type="text/css"></link>
<link href="resource/css/jquery-ui.css" rel="stylesheet" type="text/css"></link>
<link href="resource/css/picture/picture.css" rel="stylesheet" type="text/css"></link>

<script type="text/javascript" src="resource/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resource/js/jquery-ui-1.10.4.custom.js"></script>
<script type="text/javascript" src="resource/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resource/js/picture/picture.js"></script>
<script type="text/javascript">
var CONTEXT_PATH='${pageContext.request.contextPath}';
</script>
<title>Travel</title>
</head>
<body>
<form>
 
<!--  <img src="" id="image1" class="img-responsive center-block img-rounded"  style="width:30% height:50%" > -->
 <div class="container">
   
 <div id="myCarousel" class="carousel slide"   data-interval="7000">
  
  <!-- Wrapper for slides -->
  <div class="carousel-inner"> 
<!--     <div class="item active"> -->
<!--       <img src="/Travel/resource/picture/1.jpg"  file-name="1.jpg"> -->
<!--     </div> -->

<!--     <div class="item"> -->
<!--       <img src="/Travel/resource/picture/2.jpg" > -->
<!--     </div> -->

<!--     <div class="item"> -->
<!--       <img src="/Travel/resource/picture/3.jpg"  > -->
<!--     </div> -->
<!--     <div class="item"> -->
<!--       <img src="/Travel/resource/picture/4.jpg"  > -->
<!--     </div> -->
<!--     <div class="item"> -->
<!--       <img src="/Travel/resource/picture/5.jpg"  > -->
<!--     </div> -->
  </div>
<!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <font color="#4169e1" class="small">上一張</font>
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only"></span>
     
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only"></span>
      <font color="#4169e1" class="small">下一張</font>
    </a>
   
</div>
</div>
</form> 
</body>
</html>