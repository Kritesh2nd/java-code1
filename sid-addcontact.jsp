<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.*,java.util.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "login";
String userid = "root";
String password = "";
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String btn = request.getParameter("button");
%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>JSP Page</title>
  <%@include file="Allcss.jsp"%>
</head>
<body style="background-color: #dfe4ed;">
  <%@include file="navbar.jsp"%>
  <div class="container-fluid">
    <div class="row p-2">
      <div class="col-md-6 offset-md-3">
        <div class="card">
          <div class="card-body">
          <h4 class="text-center text-success"> Add contact page</h4>
            <form>
              <div class="form-group">
                <label for="exampleInputEmail1">Enter name</label>
                <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter name" name="cname">
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">Enter email</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="cemail">
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">Enter phone number</label>
                <input type="number" class="form-control" placeholder="Enter phone number" name="cnumber">
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">Enter message</label>
                <input type="number" class="form-control" placeholder="Enter phone number" name="cmessage">
              </div>
              <div class="text-center">
                <button type="submit" class="btn btn-primary" name="addcontact">Add contact</button>
              </div>
              <%
                String cname = request.getParameter("cname");
                String cemail = request.getParameter("cemail");
                String cnumber = request.getParameter("cnumber");
                String addcontact = request.getParameter("addcontact");
                String cmessage = request.getParameter("cmessage");
                try{
                Class.forName("com.mysql.jdbc.Driver");  
                connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                statement=connection.createStatement();
                if(addcontact!=null){
                  String sql ="insert into contact(name,email,number,message)values('"+cname+"','"+cemail+"',"+cnumber+",'"+cmessage+"');";
                  statement.executeUpdate(sql);
                  out.print("<script>alert('New contact added sucessfully');</script>");
                }
                connection.close();
                }
                catch(Exception ex) {
                  System.out.println(ex.toString());
                }
              %>              
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>

