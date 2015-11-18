<%@include file="WEB-INF/fragmentos/top.jspf"%>
        <div class="btn-group btn-group-justified" role="group" aria-label="...">
  <div class="btn-group" role="group">
    <button type="button" class="btn btn-default">Realizar compra</button>
  </div>
  <div class="btn-group" role="group">
    <button type="button" class="btn btn-default">Editar</button>
  </div>
  <div class="btn-group" role="group">
    <button type="button" class="btn btn-default">Eliminar</button>
  </div>
</div>



<div class="container">
     <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Registrar</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">    
        <form action="controlcompra" method="post"> 
            <input type="hidden" name="opcion" value="RegistrarCompra">
                <table class="table table-condensed">
                    <tbody>
                            <div class="form-group">
                                    <label class="control-label col-md-1">Nombre</label>
                                    <div class="col-md-2">
                                    <input type="text" class="form-control" placeholder="Nombre">
                                    <br>
                                </div>
                            </div>
                            <div class="form-group" class="">
                                    <label  class="control-label col-md-1">Apellidos</label>
                                    <div class="col-md-2">
                                    <input type="text" class="form-control" placeholder="">
                                    <br>
                                    </div>
                            </div>
                            <div class="form-group">
                                    <label class="control-label col-md-1">DNI</label>
                                    <div class="col-md-2">
                                    <input type="text" class="form-control" placeholder="">
                                    <br>
                                </div>
                            
                            <div class="form-group" class="">
                                    <label  class="col-sm-1 control-label">fecha</label>
                                    <div class="col-sm-2"> 
                                    <input type="date" class="form-control" placeholder="">
                                    <br>
                                    </div>
                            </div>
                                    <div class="form-group">
                                    <label class="control-label col-md-1">Producto</label>
                                    <div class="col-md-2">
                                    <input type="text" class="form-control" placeholder="">
                                    <br>
                                </div>
                            </div>

                            <div class="form-group">
                                    <label class="control-label col-md-1">Precio</label>
                                   
                                    <div class="col-md-2"> 
                                    <input type="text" class="form-control" placeholder="">
                                    <br>
                                </div>

                             <div class="form-group">
                                    <label class="control-label col-md-1">cantidad</label>
                                    <div class="col-md-2">
                                    <input type="text" class="form-control" placeholder="">
                                    <br>
                                </div>
                            </div>
                            <div class="form-group" class="">
                                    <label  class="control-label col-md-1">Descuento</label>
                                    <div class="col-md-2">
                                    <input type="text" class="form-control" placeholder="">
                                    <br>
                                    </div>
                            </div>
                            <div class="form-group">
                                    <label class="control-label col-md-1">Proveedor</label>
                                    <div class="col-md-2">
                                    <input type="text" class="form-control" placeholder="">
                                    <br>
                                </div>
                            <div class="form-group">
                                    <label class="control-label col-md-1">Nom_empresa</label>
                                    <div class="col-md-2">
                                    <input type="text" class="form-control" placeholder="">
                                    <br>
                                </div>
                            </div>
                             
                            <div class="form-group" class="">
                                    <label  class="control-label col-md-1">RUC</label>
                                    <div class="col-md-2"> 
                                    <input type="text" class="form-control" placeholder="">
                                    <br>
                                    </div>
                            </div>
                            <div class="form-group">
                                    <label class="control-label col-md-1">Telefono</label>
                                   
                                    <div class="col-md-2"> 
                                    <input type="text" class="form-control" placeholder="">
                                    <br>
                                </div>
                                    





                             <div class="form-group">
                                    <label class="control-label col-md-1">Razon social</label>
                                    <div class="col-md-2">
                                    <input type="text" class="form-control" placeholder="Nombre">
                                    <br>
                                </div>
                            </div>
                            <div class="form-group" class="">
                                    <label  class="control-label col-md-1">falta campo</label>
                                    <div class="col-md-2">
                                    <input type="text" class="form-control" placeholder="">
                                    <br>
                                    </div>
                            </div>
                            <div class="form-group">
                                    <label class="control-label col-md-1">falta campo</label>
                                    <div class="col-md-2">
                                    <input type="text" class="form-control" placeholder="">
                                    <br>
                                </div>
                            <div class="form-group">
                                    <label class="control-label col-md-1">falta campo</label>
                                    <div class="col-md-2">
                                    <input type="text" class="form-control" placeholder="">
                                    <br>
                                </div>
                            </div>
                             
                            <div class="form-group" class="">
                                    <label  class="control-label col-md-1">falta campo</label>
                                    <div class="col-md-2"> 
                                    <input type="text" class="form-control" placeholder="">
                                    <br>
                                    </div>
                                                               
                                    
                              <tr>
                    <td colspan="2" align="center">
                        <input type="submit" class="btn btn-primary" value="Registrar">
                        <input type="reset" class="btn btn-default" value="Limpiar">
                    </td> 
                </tr>      
                             
                         </tbody>
            </table>
        </form>
      </div>
      </div>
    </div>
    </body>
</html>
