<%-- 
    Document    : inicio 
    Created on  : 29/09/2021, 12:03:29 PM 
    Author      : Natan Ortiz Lozano 
--%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>EasyParkig - Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"/>
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="font/font-awesome-4.7.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="font/font-awesome-4.7.0/css/font-awesome.css" />
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link href="img/logo.png" rel="icon">
    </head>
    <body>
        <img src="img/fondo.jpg" style="position: absolute;width: 100%;height: 100%;">
        <div clas="row">
            <nav class="navbar navbar-expand-lg navbar-light barraNav">
                <div class="container">
                    <a class="navbar-brand">
                        <img src="img/logo.png" class="d-inline-block align-text-top" alt="" width="30" height="24"/>
                        EasyParking
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>
            </nav>
        </div>
        <div class="container">
            <div class="row mt-5">
                <div class="col-5">
                    <div class="card p-3" style="margin-top: 25%;" ng-app="easyParking" ng-controller="controladorRegistro">
                        <h5 class="text-center">Login - EasyParking</h5>
                        <form>
                            <div class="form-group">
                                <label>Usuario</label>
                                <input type="text" class="form-control" ng-model="usuario" required>
                            </div>
                            <div class="form-group">
                                <label>Clave</label>
                                <input type="password" class="form-control" ng-model="clave" required>
                            </div>
                            <div class="form-group mt-3">
                                <button type="submit" class="btn color1" ng-click="ingresar()"><i class="fa fa-arrow-right"></i> Ingresar</button>
                            </div>
                        </form>
                    </div>
                    <div id="respuesta"></div>    
                </div>
                <div class="col-4"></div>
                <div class="col-3"></div>
            </div>
        </div>
        <script src="controladorRegistro.js"></script>
    </body>
</html>