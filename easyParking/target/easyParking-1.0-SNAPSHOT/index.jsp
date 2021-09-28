<%-- 
    Document   : index
    Created on : 24/09/2021, 01:29:32 PM
    Author     : Natan Ortiz Lozano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <script src = "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
    </head>
    <body>
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
    </body>
    <script src="controlador.js"></script>
</html>