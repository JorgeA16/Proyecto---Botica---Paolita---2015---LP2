<%@page import="Entidad.Seccion"%>
<%@page import="Dao.SeccionDao"%>
<%@page import="DaoImpl.SeccionDaoImpl"%>
<%@page import="Entidad.UnidadMedida"%>
<%@page import="Dao.UnidadMedidaDao"%>
<%@page import="DaoImpl.UnidadMedidaDaoImpl"%>
<%@page import="Entidad.Producto"%>
<%@page import="DaoImpl.ProductoDaoImpl"%>
<%@page import="Dao.ProductoDao"%>
<%@include file="WEB-INF/fragmentos/top.jspf" %>
<%    ProductoDao dao = new ProductoDaoImpl();
%>
<%
    String buscar, opcion, id_producto;
    int idpoducto = 0;
    idpoducto = request.getParameter("id_producto") == null ? 0 : Integer.parseInt(request.getParameter("id_producto"));
    String tipo = request.getParameter("tipo");
     opcion = request.getParameter("opcion");
    if(opcion==null)
    {
        opcion="";
    }
     id_producto = request.getParameter("id_producto");
    if(id_producto==null)
    {
        id_producto="";
    }
    tipo = request.getParameter("tipo") == null ? "" : tipo;
    Producto p = new Producto();

    if (tipo.equals("Actualizar")) {

        p = dao.buscarProductoID(idpoducto);
        /*p.getNombre_producto();
         p.getCantidad();
         p.getComposicion();*/

    }
%>
<%
    buscar = request.getParameter("buscar");
    if (buscar == null) {
        buscar = "";
    }

%>

<div class="col-lg-6" >
    <div class="row" style="margin: 5px;">
        <form name="producto" method="post"  action="ingresa_producto.jsp" >
            <input type="hidden" name="id_producto" value="<%=id_producto%>"/>
                    <a href="ingresa_producto.jsp" class="btn btn-primary">Nuevo Producto</a>
                 
            <div class="modal-group">
                <div class="form-group">
                    <label for="exampleInputPassword1">Nombre Producto</label>
                    <input type="text" class="form-control" id="nombre_producto" name="nombre_producto" placeholder="Nombre Producto">
                </div>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Cantidad</label>
                <input type="number" class="form-control" id="cantidad" name="cantidad" placeholder="Cantidad" >
            </div>
            <!-- <div class="form-group">
                 <label for="exampleInputPassword1">Composicion</label>
                 <input type="text" class="form-control" id="Composicion" name="Composicion" placeholder="Composicion" >
             </div>  -->
            <div class="form-group">
                <label for="exampleInputPassword1">FECHA</label>
                <input  type="date" name="fecha_ven" id="fecha_ven">
            </div>
            <select class="form-control" name="id_unidad_medida" id="id_unidad_medida">
                <option>Unidad De Medida</option>
                <%                UnidadMedidaDao uni = new UnidadMedidaDaoImpl();
                    for (UnidadMedida unid : uni.listarUnidadMedida()) {
                %>
                <option value="<%=unid.getId_unidad_medida()%>"><%=unid.getNombre_unida_med()%></option>
                <%}%>
            </select>
            <br>
            <select class="form-control" name="id_seccion" id="id_seccion">
                <option>Seccion</option>
                <%
                    SeccionDao sec = new SeccionDaoImpl();
                    for (Seccion secc : sec.listarSeccion()) {
                %>
                <option value="<%=secc.getId_seccion()%>"><%=secc.getNombre_categoria()%></option>
                <%}%>
            </select>
            <br>
            <input  name="opcion" type="submit" class="btn btn-primary" value="Registrar"/>
            
            <input type="reset" class="btn btn-default" value="Limpiar">
        </form>  
    </div>
</div>
<%if(opcion.equals("Editar")){
  Producto prod=dao.DatosProducto_edit(id_producto);
%>
<script type="text/javascript">
    document.producto.nombre_producto.value='<%=prod.getNombre_producto()%>';
    document.producto.cantidad.value='<%=prod.getCantidad()%>';
    document.producto.fecha_ven.value='<%=prod.getFecha_ven()%>';
    document.producto.id_unidad_medida.value='<%=prod.getId_unidad_medida()%>';
    document.producto.id_seccion.value='<%=prod.getId_seccion()%>';
    document.producto.opcion.value='Actualizar';
    </script>
<%}%>




<div class="col-lg-6">
    <form name="form" method="post" action="reg_producto.jsp">
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
                    <th>SECCION</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int i = 0;
                    for (Producto pro : dao.listarProductoVista(buscar)) {
                        i = i + 1;
                %>
                <tr>

                    <td><%=i%></td>
                    <td><%=pro.getNombre_producto()%></td>
                    <td><%=pro.getCantidad()%></td>
                    <td><%=pro.getAbreviatura()%></td>
                    <td><%=pro.getNombre_categoria()%></td>
                    <td><a href="reg_producto.jsp?id_producto=<%=pro.getId_producto()%>&opcion=Editar">Editar</a></td>
                    <td><a href="ingresa_producto.jsp?id_producto=<%=pro.getId_producto()%>&opcion=Eliminar">Eliminar</a></td>

                </tr>
                <%}%>
            </tbody>
        </table>
    </center>
</div>
<%@include file="WEB-INF/fragmentos/bottom.jspf" %>