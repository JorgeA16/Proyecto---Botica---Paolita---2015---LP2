<%-- 
    Document   : prueba1
    Created on : 03/11/2015, 06:26:53 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="login-card">
    <h1>Log-in</h1><br>
  <form>
    <input type="text" name="user" placeholder="Username">
    <input type="password" name="pass" placeholder="Password">
    <input type="submit" name="login" class="login login-submit" value="login">
  </form>
    
  <div class="login-help">
    <a href="#">Register</a> • <a href="#">Forgot Password</a>
  </div>
</div>
    
        <script src="js/index.js"></script>
        <script type="text/javascript" 
          src="jquery/jquery-2.1.4.min.js" 
          ></script>
        <script type="text/javascript" 
          src="bootstrap/js/bootstrap.min.javascript" 
          ></script>
    </body>
</html>
