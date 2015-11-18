<%@page import="Entidad.Seccion"%>
<%@page import="Entidad.Unidad_Medida"%>
<%@page import="Entidad.Producto"%>
<%@page import="DaoImpl.ProductoDaoImpl"%>
<%@page import="Dao.ProductoDao"%>
<%@include file="WEB-INF/fragmentos/top.jspf" %>
<%
            ProductoDao dao = new ProductoDaoImpl();
%>
<%!
            String buscar;
        %>
        <%
            buscar = request.getParameter("buscar");
            if (buscar == null) {
                buscar = "";
            }

        %>
<div class="col-lg-6" >
    <div class="row" style="margin: 5px;">
        <form action="insertardato.jsp">
        <div class="modal-group">
            <div class="form-group">
                <label for="exampleInputPassword1">Nombre Producto</label>
                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre Producto">
            </div>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Cantidad</label>
            <input type="number" class="form-control" id="Cantidad" name="cantidad" placeholder="Cantidad">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Composicion</label>
            <input type="text" class="form-control" id="Composicion" name="Composicion" placeholder="Composicion">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">FECHA</label>
            <input  type="date" name="fecha">
        </div>
       <select class="form-control" name="unime" value="">
            <option>Unidad De Medida</option>
            <%
            for(Unidad_Medida unid:dao.listaruni_med()){
            %>
            <option value="<%=unid.getId_unidad_medida()%>"><%=unid.getNombre_unida_med()%></option>
           <%}%>
        </select>
        <br>
        <select class="form-control" name="sec" value="">
            <option>Seccion</option>
           <%
            for(Seccion sec:dao.listarseccion()){
            %>
            <option value="<%=sec.getId_seccion()%>"><%=sec.getNombre_categoria()%></option>
           <%}%>
        </select>
        <br>
        <div class="form-group">
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" class="btn btn-primary" value="Registrar"> 
                    <input type="reset" class="btn btn-default" value="Limpiar">
                    <button type="button" class="btn btn-default" data-dismiss="modal">CERRAR</button> 
                </td>
            </tr>
        </div>
    </form>
    </div>
</div>
<div class="col-lg-6">
    <form name="form" method="post" action="venta_cliente.jsp">
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
        <table class="table table-responsive info">
        <thead>
            <tr>
                <th>#</th>
                <th>NOMBRE</th>
                <th>CANTIDAD</th>
                <th>UNIDAD DE MEDIDA</th>
                <th>SECCION</th>
            </tr>
        </thead>
        <tbody>
            <%                              
                              for (Producto pro : dao.listarProducto(buscar)) {
            %>
            <tr>

                <td><%=pro.getId_producto()%></td>
                <td><%=pro.getNombre_producto()%></td>
                <td><%=pro.getCantidad()%></td>
                <td><%=pro.getId_unidad_medida()%></td>
                <td><%=pro.getId_seccion()%></td>
                <td><a href="producto_edit_delet.jsp?id_producto=<%=pro.getId_producto()%>">Editar</a></td>
                <td><a href="producto_edit_delet.jsp?id_producto=<%=pro.getId_producto()%>&opcion=Eliminar">Eliminar</a></td>

            </tr>
            <%}%>
        </tbody>
    </table>
      </center>
</div>
    <%@include file="WEB-INF/fragmentos/bottom.jspf" %>