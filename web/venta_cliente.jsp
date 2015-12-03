<%@page import="Entidad.Unidad"%>
<%@page import="DaoImpl.UnidadDaoImpl"%>
<%@page import="Dao.UnidadDao"%>
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
%>
<%!
    String buscar, opcion, id_persona, id_producto;
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
    id_persona = request.getParameter("id_persona");
    if (id_persona == null) {
        id_persona = "";
    }
    id_producto = request.getParameter("id_producto");
    if (id_producto == null) {
        id_producto = "";
    }
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
                <%
                    SeccionDao secc = new SeccionDaoImpl();
                    for (Seccion sec : secc.listarSeccion()) {
                %>
                <option value="<%=sec.getId_seccion()%>"><%=sec.getNombre_categoria()%></option>
                <%}%>
            </select>
        </form>
        <br>
        <div class="form-group">
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" class="btn btn-primary" value="Registrar"> 
                    <input type="reset" class="btn btn-default" value="Limpiar">-->
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#cliente">Añadir Cliente</button>
                    <!-- Button trigger modal -->
                    <!--<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                        Launch demo modal
                    </button>-->
                    <div class="table-responsive" style="overflow:scroll;height:400px;width:650px; border-bottom: 2px;">
                        
                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="cliente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document" >
                            <div class="modal-content" >
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Registrar Cliente</h4>
                                </div>
                                <div class="modal-body">
                                    <form name="cliente" action="agregar_persona.jsp" method="get">
                                        <input type="hidden" name="id_persona" value="<%=id_persona%>"/>
                                        <table class="table table-condensed">
                                            <tbody>

                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Nombres</label>
                                                <input type="text" name="nombre" class="form-control" id="exampleInputPassword1" placeholder="Nombre">
                                            </div>
                                            <tr>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Apellido Paterno</label>
                                                <input type="text" name="apepat" class="form-control" id="exampleInputPassword1" placeholder="Apellidos">
                                            </div>
                                            </tr>
                                            <tr>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Apellido Materno</label>
                                                <input type="text" name="apemat" class="form-control" id="exampleInputPassword1" placeholder="Apellidos">
                                            </div>
                                            </tr>
                                            <tr>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">DNI</label>
                                                <input type="text" name="dni" class="form-control" id="exampleInputPassword1" placeholder="Sexo">
                                            </div>
                                            </tr>
                                            <tr>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Celular</label>
                                                <input type="text" name="celular" class="form-control" id="exampleInputPassword1" placeholder="Celular">
                                            </div>
                                            </tr>
                                            <tr>
                                            <select class="form-control" name="sexo">
                                                <option>Seleccionar</option>
                                                <option >M</option>
                                                <option >F</option>
                                            </select>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-primary">Añadir Cliente</button>-->

                                                    <input  name="opcion" type="submit" class="btn btn-primary" value="Registrar">
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
        </div>
    <!--</div>
</div>-->
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
            <div class="col-lg-2" ></div>
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
                <label for="exampleInputPassword1">Presentacion</label>
                <select class="form-control" name="id_unidad" id="id_unidad">
                    <option>Presentacion</option>
                    <%
                        UnidadDao unidad = new UnidadDaoImpl();
                        for (Unidad unida : unidad.listarUnidad()) {
                    %>
                    <option value="<%=unida.getId_unidad()%>"><%=unida.getNombre_unidad()%></option>
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
        <div class="table-responsive" style="overflow:scroll;height:400px;width:650px;">
            <table class="table table-striped well">

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
                        for (Producto pro : dao.listarProducto(buscar)) {
                            i = i + 1;
                    %>
                    <tr>

                        <td><%=i%></td>
                        <td><%=pro.getNombre_producto()%></td>
                        <td><%=pro.getCantidad()%></td>
                        <td><%=pro.getId_unidad_medida()%></td>
                        <td><%=pro.getId_seccion()%></td>
                        <td>
                            <a href="venta_cliente.jsp?id_producto=<%=id_producto%>&id_producto=<%=pro.getId_producto()%>&opcion=Agregar">
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