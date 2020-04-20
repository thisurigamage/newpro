<%@ page import="com.Channeling" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  
    <%
    //Insert item----------------------------------
    
   if (request.getParameter("patientName") != null)
    {
    Channeling channelObj = new Channeling();
    String stsMsg = channelObj.insertChannel(request.getParameter("patientName"),request.getParameter("doctorName"),request.getParameter("hospitalName"),request.getParameter("specialization"),request.getParameter("date"));
    
    session.setAttribute("statusMsg", stsMsg);
    }
    
  //Delete item----------------------------------
    if (request.getParameter("channelingCode") != null)
     {
     Channeling channelObj = new Channeling();
    String stsMsg = channelObj.deletechannel(request.getParameter("channelingCode"));
    session.setAttribute("statusMsg", stsMsg);
    }
   %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Channeling Managment</title>
</head>
<body>
<div class="text-center">


<h1>Channeling Management</h1>
</div>
<form method="post" action="Channeling.jsp">
 
 <div class="form-group row">
 	 	<label class="col-sm-1 col-form-label">Patient name </label>  <div class="col-sm-8">  <input name="patientName" type="text" class="form-control" required></div></div>
 <div class="form-group row">
 	 	<label class="col-sm-1 col-form-label">Doctor name</label>  <div class="col-sm-8">   <input name="doctorName" type="text" class="form-control" required ></div></div>
 <div class="form-group row">
 <label class="col-sm-1 col-form-label">Hospital name</label>  <div class="col-sm-8"> <input name="hospitalName" type="text" class="form-control" required></div></div>
  <div class="form-group row">
 <label class="col-sm-1 col-form-label">Specialization</label><div class="col-sm-8"> <input name="specialization" type="text"  class="form-control" required></div></div>
 <div class="form-group row">
 <label class="col-sm-1 col-form-label">Date</label><div class="col-sm-8"><input name="date" type="date" class="form-control"  required></div></div>
 
  <input name="btnSubmit" type="submit" value="Save" class="btn btn-primary col-sm-3">
  <input name="btnCancel" type="submit" value="Cancel" class="btn btn-primary col-sm-3" >
</form>

<div class="alert alert-success"> 

<% out.print(session.getAttribute("statusMsg"));
%>
</div>

<br>

<%
 Channeling channelObj = new Channeling();
 out.print(channelObj.readchannel());
%>



</body>
</html>