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
    id_producto = request.getParameter("id_producto");
    if (id_producto == null){
        id_producto = "";
    }
    buscar = request.getParameter("buscar");
    if (buscar == null) {
        buscar = "";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte de Productos</title>
    </head>
    <body>
        <div class="form-group">
                <label for="exampleInputPassword1">FECHA 1</label>
                <input  type="date" name="fecha_ven" id="fecha_ven">
            </div>
        <div class="form-group">
                <label for="exampleInputPassword1">FECHA  2</label>
                <input  type="date" name="fecha_ven" id="fecha_ven">
            </div>
    <form name="form" method="post" action="reporte_producto.jsp">
        <table align="center" width="100%">
            <tr>
                <td align="left" width="50%">
                    Nombre:
                    <input type="text" name="buscar" value="<%=buscar%>" placeholder="Buscar" size="15"/>
                    <input type="submit" name="btn btn-defaul" value="Buscar"/>
                </td>
            </tr>
        </table>
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
                    for (Producto pro : dao.listarProductoVista(id_producto)) {
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
    </body>
</html>
<%@include file="WEB-INF/fragmentos/bottom.jspf" %>