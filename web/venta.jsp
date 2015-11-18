
<%@include file="WEB-INF/fragmentos/top.jspf"%>



<link rel="stylesheet" type="text/css"  href="estilos/venta.css">
<div class="col-lg-4"></div>
<div class="col-lg-4">
<div class="modal-body">
    <div class="form-group">
        <label for="exampleInputPassword1">Nombres</label>
        <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Npmbre">
    </div>
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">Apellidos</label>
        <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Apellidos">
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">DNI</label>
        <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Sexo">
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">Celular</label>
        <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Celular">
    </div>
    <select class="form-control" name="Sexo" value="Sexo">
        <option>Sexo</option>
        <option>M</option>
        <option>F</option>
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
</div>
<div class="col-lg-4"></div>

<!--<<div class="modal fade" id="venta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h1 class="modal-title" id="venta">venta</h1>
      </div>
      <div class="modal-body">
      <form>
  <div class="form-group">
    <label for="exampleInputEmail1">DNI</label>
    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="INGRESE DNI">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">NOMBRE</label>
    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="INGRESE NOMBRE">
  </div>
    <div class="form-group">
    <label for="exampleInputPassword1">APELLIDO PATERNO</label>
    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="INGRESE APELLIDO">
  </div>
    <div class="form-group">
    <label for="exampleInputPassword1">APELLIDO MATERNO</label>
    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="INGRESE APELLIDO">
  </div>
    <div class="form-group">
    <label for="exampleInputPassword1">TELEFONO</label>
    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="TELEFONO">
  </div>
      <div class="form-group">
    <label for="exampleInputPassword1">GENERO</label>
    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="GENERO">
  </div>
    <div class="form-group">
    <label for="exampleInputPassword1">FECHA DE NACIMIENTO: </label>
    <input type="date">
  </div>
 
  </form>
      </div>-->

 

<%@include file="WEB-INF/fragmentos/bottom.jspf"%>