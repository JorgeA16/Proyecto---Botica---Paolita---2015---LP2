<%@page import="Entidad.Usuario"%>
<%@page import="Dao.UsuarioDao"%>
<%@page import="DaoImpl.UsuarioDaoImpl"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Botica Paolita</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" 
        href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/javascript" 
        href="estilos/login.css">
    </head>
    <body>
        <div class="container">
  
  <div class="row" id="pwd-container">
    <div class="col-md-4"></div>
    
    <div class="col-md-4">
      <section class="login-form">
        <form method="post" action="login.jsp" role="login">
        	<h2>Botica Paolita</h2>
          <input type="text" name="usuario" placeholder="Usuario" required class="form-control" />
          
          <input type="password" name="contraseña" class="form-control input-lg" id="password" placeholder="Password" required="" />
          
          
          <div class="pwstrength_viewport_progress"></div>
          
          
          <button type="submit" class="btn btn-lg btn-primary btn-block">Ingresar</button>
          <%
         String usuario = request.getParameter("usuario");
         String contraseña = request.getParameter("contraseña");
         String salir = request.getParameter("salir");
         salir = request.getParameter("salir")== null ? salir="":salir;
                 
         
         if(usuario != null & contraseña != null){
             UsuarioDao dao = new UsuarioDaoImpl();
             Usuario u = new Usuario();
             u = dao.validarUsuario(usuario, contraseña);
             if (u.getUsuario() != null){
                 session.setAttribute("usuario", u.getUsuario());
                 response.sendRedirect("inicio.jsp");
                 /*if(u.getRol().equals("administrador")){
                     response.sendRedirect("inicio.jsp");
                 }*/
                 
             }else{
                 out.print("NO EXISTE EL USUARIO.");
             }
         }
         
         if(salir.equals("cerrar")){
             session.removeAttribute("usuario");
         }
     %>
          <div>
            <a href="#">Crear cuenta</a>
          </div>
          
        </form>
        
        <div class="form-links">
          <a href="#">www.jorgecorporacion.com</a>
        </div>
      </section>  
      </div>
      
    </div>
  </div>
		<script type="text/javascript" 
        	src="jquery/jquery-2.1.4.min.js" 
        	></script>
        <script type="text/javascript" 
        	src="bootstrap/js/bootstrap.min.javascript" 
        	></script>
    </body>
</html>
    