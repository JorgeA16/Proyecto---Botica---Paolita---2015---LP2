<%@page import="Dao.ProductoDao"%>
<%@page import="DaoImpl.ProductoDaoImpl"%>
<%@page import="Entidad.Producto"%>
<%@include file="WEB-INF/fragmentos/top.jspf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%    ProductoDao dao = new ProductoDaoImpl();
%>
<%
    String id_producto, buscar;
    String fecha1 = "";
    String fecha2 = "";
    if (request.getParameter("fecha1") != null & request.getParameter("fecha2") !=null){
       fecha1 = request.getParameter("fecha1");
       fecha2 = request.getParameter("fecha2");
    }
    buscar = request.getParameter("buscar");
    if (buscar == null) {
        buscar = "";
    }
    id_producto = request.getParameter("id_producto");
    if (id_producto == null) {
        id_producto = "";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte de Productos</title>
    </head>
    <body>
            <form method="post" action="reporte_producto_2.jsp">
            <div class="form-group">
                    <label for="exampleInputPassword1">FECHA 1</label>
                    <input  type="date" name="fecha1" id="fecha_ven" value="<%=fecha1%>">
                </div>
            <div class="form-group">
                    <label for="exampleInputPassword1">FECHA  2</label>
                    <input  type="date" name="fecha2" id="fecha_ven" value="<%=fecha2%>">
                    <input type="submit" name="btn btn-defaul" value="Buscar"/>
                </div>
        </form>
        <center>
            <table class="table table-responsive info table-bordered">
            <thead>
                <tr>
                    <th>#</th>
                    <th>NOMBRE</th>
                    <th>CANTIDAD</th>
                    <th>UNIDAD DE MEDIDA</th>
                    <th>FECHA DE VENCIMIENTO</th>
                    <th>SECCION</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int i = 0;
                    for (Producto pro : dao.listarProductoFecha(fecha1, fecha2)) {
                        i = i + 1;
                %>
                <tr>

                    <td><%=i%></td>
                    <td><%=pro.getNombre_producto()%></td>
                    <td><%=pro.getCantidad()%></td>
                    <td><%=pro.getAbreviatura()%></td>
                    <td><%=pro.getFecha_ven()%></td>
                    <td><%=pro.getNombre_categoria()%></td>
                    <!--<td><a href="reg_producto.jsp?id_producto=<%=pro.getId_producto()%>&opcion=Editar">Editar</a></td>
                    <td><a href="ingresa_producto.jsp?id_producto=<%=pro.getId_producto()%>&opcion=Eliminar">Eliminar</a></td>-->

                </tr>
                <%}%>
            </tbody>
        </table>
    </center>
<div class="panel panel-default">
  <div class="panel-body">
    Contenido del panel
  </div>
  <div class="panel-footer">Pie del panel</div>
</div>
    </body>
</html>
<%@include file="WEB-INF/fragmentos/bottom.jspf" %>