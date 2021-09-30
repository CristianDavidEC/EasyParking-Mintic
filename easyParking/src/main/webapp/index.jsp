<%-- 
    Document   : index
    Created on : 24/09/2021, 01:29:32 PM
    Author     : Natan Ortiz Lozano
--%>
<%@include file="header.jsp" %>
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6">
                <form onsubmit="return false;" id="formulario">
                  <div class="form-group">
                    <label>Correo</label>
                    <input type="text" class="form-control" name="correo" placeholder="">
                  </div>                 
                  <div class="form-group">
                    <label>Clave</label>
                    <input type="password" class="form-control" name="clave" aria-describedby="">                     
                  </div>
                  <div style="display:none" id='cargando' class='alert alert-primary'>
                    <i class='fa fa-refresh fa-spin'></i>
                    PROCESANDO...
                  </div>
                  <div class="form-group" id="resp"></div>            
                  <div class="form-group">
                    <button onclick="mostrar()" id="btn-ingresar" type="submit" class="btn btn-primary btn-block">Ingresar</button>
                  </div>
                  <hr>
                </form>
            </div>
            <div class="col-3"></div>
            <a href="listParqueo.jsp">Lista Parqueo</a>
        </div>
    </body>
</html>