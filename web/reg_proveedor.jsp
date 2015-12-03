<%@page import="DaoImpl.ProveedorDaoImpl"%>
<%@page import="Dao.ProveedorDao"%>
<%@include file="WEB-INF/fragmentos/top.jspf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%        ProveedorDao dao = new ProveedorDaoImpl();
%>
<%
    String id_proveedor, opcion;
    id_proveedor = request.getParameter("id_proveedor");
    if (id_proveedor == null) {
        id_proveedor = "";
    }
    opcion = request.getParameter("opcion");
    if (opcion == null) {
        opcion = "";
    }
%>
<body>
    <div class="col-lg-3" ></div>
    <div class="col-lg-6" >
        <form name="proveedor" method="post" action="ingresa_proveedor.jsp">
            <input type="hidden" name="id_proveedor" value="<%=id_proveedor%>"/>
            <table class="table table-bordered" >
                <div class="form-group">
                    <label for="exampleInputPassword1">Nombre Proveedor</label>
                    <input type="text" class="form-control" id="nombre" placeholder="Nombre Proveedor" name="nombre">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Ruc</label>
                    <input type="number" class="form-control" id="ruc" placeholder="Ruc" name="ruc">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Celular</label>
                    <input type="text" class="form-control" id="celular" placeholder="Celular"name="celular">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Direccion</label>
                    <input type="text" class="form-control" id="direccion" placeholder="Direccion" name="direccion">
                </div>


                <br>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit"  name="opcion" class="btn btn-primary" value="Registrar">
                            <input type="reset" class="btn btn-default" value="Limpiar">
                            <!--<button type="button" class="btn btn-default" data-dismiss="modal">CERRAR</button>-->
                        
                        </td>
                        
                    </tr>
                </div>
            </table>
        </form>
    </div>
    
    <div class="col-lg-3" ></div>
</body>

</html>
