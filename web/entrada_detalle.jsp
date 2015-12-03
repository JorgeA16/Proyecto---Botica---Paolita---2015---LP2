<%@page import="Dao.EntradaDetalleDao"%>
<%@page import="DaoImpl.EntradaDetalleDaoImpl"%>
<%@page import="Entidad.EntradaDetalle"%>
<%@page import="Entidad.Laboratorio"%>
<%@page import="DaoImpl.LaboratorioDaoImpl"%>
<%@page import="Dao.LaboratorioDao"%>
<%@page import="Entidad.Unidad"%>
<%@page import="DaoImpl.UnidadDaoImpl"%>
<%@page import="Dao.UnidadDao"%>
<%@page import="Entidad.Entrada"%>
<%@page import="DaoImpl.EntradaDaoImpl"%>
<%@page import="Dao.EntradaDao"%>
<%@page import="java.util.List"%>
<%@page import="Entidad.UnidadMedida"%>
<%@page import="Dao.UnidadMedidaDao"%>
<%@page import="DaoImpl.UnidadMedidaDaoImpl"%>
<%@page import="Entidad.Seccion"%>
<%@page import="Dao.SeccionDao"%>
<%@page import="DaoImpl.SeccionDaoImpl"%>
<%@page import="Entidad.Producto"%>
<%@page import="DaoImpl.ProductoDaoImpl"%>
<%@page import="Dao.ProductoDao"%>
<%@include file="WEB-INF/fragmentos/top.jspf" %>
<%    ProductoDao dao = new ProductoDaoImpl();
    EntradaDao endeta = new EntradaDaoImpl();
    EntradaDetalleDao end = new EntradaDetalleDaoImpl();
%>
<%!
    String buscar, opcion, id_lote_interno, id_producto, id_entrada;
%>
<%
    buscar = request.getParameter("buscar");
    if (buscar == null) {
        buscar = "";
    }
    opcion = request.getParameter("opcion");
    if (opcion == null) {
        opcion = "";
    }
    id_lote_interno = request.getParameter("id_lote_interno");
    if (id_lote_interno == null) {
        id_lote_interno = "";
    }
    id_producto = request.getParameter("id_producto");
    if (id_producto == null) {
        id_producto = "";
    }
    id_entrada = request.getParameter("id_entrada");
    if (id_entrada == null) {
        id_entrada = "";
    }

%>
<%
    
%>
<div class="col-lg-6" >
    <!--<div class="row" style="margin: 5px;" >
        <form action="agregar_persona.jsp">
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
            <select class="form-control" name="unime">
                <option>Unidad De Medida</option>
    <%                    UnidadMedidaDao uni = new UnidadMedidaDaoImpl();
        for (UnidadMedida unid : uni.listarUnidadMedida()) {
    %>
    <option value="<%=unid.getId_unidad_medida()%>"><%=unid.getNombre_unida_med()%></option>
    <%}%>
</select>
<br>
<select class="form-control" name="sec">
    <option>Seccion</option>
    <%/*
         SeccionDao secc = new SeccionDaoImpl();
         for (Seccion sec : secc.listarSeccion()) {
    %>
    <option value="<%/*=sec.getId_seccion()*/%>"><%/*=sec.getNombre_categoria()*/%></option>
    <%//}%>
</select>
</form>
<br>
<div class="form-group">
<tr>
    <td colspan="2" align="center">
        <input type="submit" class="btn btn-primary" value="Registrar"> 
        <input type="reset" class="btn btn-default" value="Limpiar">-->
    <!-- Button trigger modal -->
    <!--<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
        Launch demo modal
    </button>-->
    <%


        Entrada dat = endeta.Datos_entrada(id_entrada);
    %>
    <form name="producto" action="ingresa_entrada_detalle.jsp" method="get">
        <input type="hidden" name="id_producto" value="<%=id_producto%>"/>
        <input type="hidden" name="id_entrada" value="<%=id_entrada%>"/>
        <table class="table table-condensed">
            <tbody>
            <div class="col-lg-5" >
                <div class="form-group">
                    <label for="exampleInputPassword1">Serie: </label>
                    <%=dat.getSerie()%>
                </div>
            </div>
            <div class="col-lg-5" >
                <div class="form-group">
                    <label for="exampleInputPassword1">N° Comprobante: </label>
                    <%=dat.getNumero_comp()%>
                </div>
            </div>
            <div class="col-lg-5" >
                <div class="form-group">
                    <label for="exampleInputPassword1">Proveedor:</label>
                    <%=dat.getId_proveedor()%>
                </div>
            </div>
            <div class="col-lg-5" >
                <div class="form-group">
                    <label for="exampleInputPassword1">Comprobante: </label>
                    <%=dat.getId_comprobante()%>
                </div>
            </div>
            <div class="col-lg-2" ></div>
            <div class="col-lg-4" >
                <div class="form-group">
                    <label for="exampleInputPassword1">Fecha:</label>
                    <%=dat.getFecha()%>

                </div>
            </div>
            <div class="col-lg-1" ></div>
            <div class="col-lg-5" >
                <div class="form-group">
                    <label for="exampleInputPassword1">Forma de pago:</label>
                    <%=dat.getId_forma_pago()%>
                </div>
            </div>
            <%
                if (opcion.equals("Agregar")) {

                    Producto prod = dao.DatosProducto_edit(id_producto);
            %>
            <div class="col-lg-5" >
                <div class="form-group">
                    <label for="exampleInputPassword1">Nombre Producto</label>
                    <%=prod.getNombre_producto()%>
                </div>
            </div>
            <div class="col-lg-9" ></div>
            <div class="col-lg-4" >
                <div class="form-group">
                    <label for="exampleInputPassword1">Cantidad</label>
                    <input type="text" name="cantidad" class="form-control" id="exampleInputPassword1" placeholder="Cantidad">
                </div>
            </div>
            
            <div class="col-lg-4" >
                <div class="form-group">
                    <label for="exampleInputPassword1">Precio</label>
                    <input type="text" name="precio_compra" class="form-control" id="exampleInputPassword1" placeholder="Precio">
                </div>
            </div>
            <div class="col-lg-3" ></div>
            <div class="col-lg-4" >
                <div class="form-group">
                    <label for="exampleInputPassword1">Cantidad Unidad</label>
                    <input type="text" name="cantidad_uni" class="form-control" id="exampleInputPassword1" placeholder="Cantidad Unidad">
                </div>
            </div>

            <div class="col-lg-4" >
                <label for="exampleInputPassword1">Unidad</label>
                <select class="form-control" name="id_unidad" id="id_unidad">
                    <option>Unidad</option>
                    <%
                        UnidadDao unidad = new UnidadDaoImpl();
                        for (Unidad unida : unidad.listarUnidad()) {
                    %>
                    <option value="<%=unida.getId_unidad()%>"><%=unida.getNombre_unidad()%></option>
                    <%}%>
                </select>
            </div>
                <div class="col-lg-4" >
                <div class="form-group">
                <label for="exampleInputPassword1">Fecha Venciminento</label>
                <input  class="form-control" type="date" name="fecha_ven" id="fecha_ven" value="<%=prod.getFecha_ven()%>">
            </div>
                </div>
                <div class="col-lg-4" >
                <label for="exampleInputPassword1">Laboratorio</label>
                <select class="form-control" name="id_laboratorio" id="id_laboratorio">
                    <option>Laboratorio</option>
                    <%
                        LaboratorioDao labo = new LaboratorioDaoImpl();
                        for (Laboratorio lab : labo.listarLaboratorio()) {
                    %>
                    <option value="<%=lab.getId_laboratorio()%>"><%=lab.getNombre_laboratorio()%></option>
                    <%}%>
                </select>
            </div>
            <br>
            <tr>
                <td colspan="2" align="center">
                    <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Añadir Cliente</button>-->

                    <input  name="opcion" type="submit" class="btn btn-primary" value="Registrar">
                    <br>
                </td>
            </tr>
            
            <%}%>
            </tbody>
        </table>
            <br>
    </form>

    <form name="entrada_detalle" action="ingresa_entrada_detalle.jsp" method="post">
        <input value="<%=id_lote_interno%>" name="id_lote_interno" type="hidden">
        <div class="table-responsive" style="overflow:scroll;height:400px;width:650px; border-bottom: 2px;">
            <table class="table table-striped well">

                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nombre Producto</th>
                        <th>Unidad</th>
                        <th>Vence</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int a=0;
                        for (EntradaDetalle endt : end.listarEntradaDetalles(id_entrada)) {
                          a=a+1;  
                    %>
                    <tr>

                        <td><%=a%></td>
                        <td><%=endt.getId_producto()%></td>
                        <td><%=endt.getId_unidad()%></td>
                        <td><%=endt.getFecha_ven()%></td>
                        <td><%=endt.getCantidad()%></td>
                        <td><%=endt.getPrecio_compra()%></td>
                        <td><%=endt.getTotal()%></td>
                        <td><a href="entrada_detalle.jsp?id_lote_interno=<%=endt.getId_lote_interno()%>&opcion=Editar">Editar</a></td>
                    <td><a href="ingresa_entrada_detalle.jsp?id_lote_interno=<%=endt.getId_lote_interno()%>&opcion=Eliminar">Eliminar</a></td>

                    </tr>
                    
                    <%}%>
                </tbody>
                <tr>
                    <td align="right" colspan="6">Total:</td>
                    <td align="right"><b><%=dat.getTotal()%></b></td>
                </tr>
            </table>
        </div>
    </form>
</div>

<div class="col-lg-6">
    <form name="form" method="post" action="entrada_detalle.jsp">
        <input type="hidden" name="id_entrada" value="<%=id_entrada%>"/>
        <table align="center" width="100%">
            <tr>
                <td align="left" width="50%">
                    <div class="col-lg-9">
                        Nombre:
                        <input type="text" name="buscar" value="<%=buscar%>" placeholder="Buscar" size="15"/>
                        <input type="submit" name="btn btn-defaul" value="Buscar"/>
                    </div>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#producto">Agregar Producto</button>
                </td>
            </tr>
        </table>
    </form>

    <center>
        <div class="table-responsive" style="overflow:scroll;height:400px;width:650px;">
            <table class="table table-striped well">

                <thead>
                    <tr>
                        <th>#</th>
                        <th>NOMBRE</th>
                        <th>VENCE</th>
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
                        <td><%=pro.getFecha_ven()%></td>
                        <td>
                            <a href="entrada_detalle.jsp?id_entrada=<%=id_entrada%>&id_producto=<%=pro.getId_producto()%>&opcion=Agregar">
                                <input name="opcion" type="submit" class="btn btn-primary" value="Agregar">
                            </a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </center>
</div>
                <div class="col-lg-3">
           <input name="opcion" type="submit" class="btn btn-primary" value="Terminar">  
                </div>
                
                
<div class="modal fade" id="producto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" >
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Registrar Producto</h4>
            </div>
            <div class="modal-body">
                <form name="producto" method="post"  action="ingresa_producto.jsp" >
            <input type="hidden" name="id_producto" value="<%=id_producto%>"/>
                 
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
                <%                
                    UnidadMedidaDao unida = new UnidadMedidaDaoImpl();
                    for (UnidadMedida unid : unida.listarUnidadMedida()) {
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
    </div>
</div>
</div>

<!--<%
    //ProductoDao dao = new ProductoDaoImpl();
%>
<div class="formu">
    <form class="form-horizontal" action="venta.jsp" method="Post">
        <div class="form-group">
            <label class="control-label col-xs-1"></label>
            <div class="col-xs-0"></div>
            <script type="text/javascript">
                function filter(phrase, _id) {
                    var words = phrase.value.toLowerCase().split(" ");
                    var table = document.getElementById(_id);
                    var ele;
                    for (var r = 1; r < table.rows.length; r++) {
                        ele = table.rows[r].innerHTML.replace(/<[^>]+>/g, "");
                        var displayStyle = 'none';
                        for (var i = 0; i < words.length; i++) {
                            if (ele.toLowerCase().indexOf(words[i]) >= 0)
                                displayStyle = '';
                            else {
                                displayStyle = 'none';
                                break;
                            }
                        }
                        table.rows[r].style.display = displayStyle;
                    }
                }

            </script>
            <div class="col-md-10">
                <label class="control-label col-xs-6"></label>
                <div class="col-md-12">
                    <div class="input-group col-xs-12">
                        <input name="filt" onkeyup="filter(this, 'tabj', '1')" type="text" class="form-control" placeholder="Nombre a Buscar" autofocus>
                    </div>
                </div>
            </div>
        </div>
        <div style="overflow:scroll;height:300px;width:500px;"> 
            <div class="table-responsive">
                <table id="tabj" class="table table-striped well">
                    <thead>
                        <tr hidden>
                            <th>#</th>
                            <th>Id Contrato</th>
                            <th>Nombres y Apellidos</th>
                            <th>Seleccionar</th>
                        </tr>
                    </thead>
                    <tbody>
<%
    int count = 0;
    List<Producto> lista = dao.listarProducto(buscar);
    for (Producto pro : lista) {
        count++;
%>
<tr>
    <td><%=count%>.</td>
    <td hidden><%=pro.getId_producto()%></td>
    <td><%=pro.getNombre_producto()%>&nbsp;<%=pro.getFecha_ven()%></td>
    <td>
        <a class="btn btn-primary" href="detalleventa.jsp?opcion=control&idContrato=<%=pro.getId_producto()%>&nombres=<%=pro.getNombre_producto()%> <%=pro.getFecha_ven()%>&opc=1&tipo=r">Control</a>                                                                    
    </td>
</tr>
<%}%>
</tbody>
</table>
</div>
</div>
</form>
</div>-->
<%@include file="WEB-INF/fragmentos/bottom.jspf" %>