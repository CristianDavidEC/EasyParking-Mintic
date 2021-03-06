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
        <title>EasyParking - Inicio</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"/>
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="font/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="font/font-awesome-4.7.0/css/font-awesome.css"/>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link href="img/logo.png" rel="icon">
    </head>
    <body>
        <script>
            usuarioact = sessionStorage.getItem('usuarioact');
            if (usuarioact === null) {
                console.log(usuarioact);
                window.location.href = 'index.jsp';
            }
        </script>
        <div ng-app="easyParking" ng-controller="controladorRegistro">
            <nav class="navbar navbar-expand-lg navbar-light barraNav">
                <div class="container">
                    <a class="navbar-brand">
                        <img src="img/logo.png" class="d-inline-block align-text-top" alt="" width="30" height="24"/>
                        EasyParking
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <div class="float-right">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#" ng-click="cerrarSesion()"><button class="btn color1"><i class="fa fa-power-off"></i> Cerrar Sesi??n</button></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
            <div class="container">
                <div class="row m-3">
                    <div class="col-10">
                        <h2>GESTI??N DE PARQUEADERO</h2>
                    </div>
                    <div class="col-2 ps-5">
                        <button type="button" class="btn color1" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            <i class="fa fa-car" aria-hidden="true"></i> Parquear
                        </button>
                    </div>
                </div>
                <table class="table" ng-init="listarRegistros()">
                    <thead>
                        <tr>
                            <th scope="col">Propietario</th>
                            <th scope="col">Placa Veh??culo</th>
                            <th scope="col">Plaza</th>
                            <th scope="col">Fecha Ingreso</th>
                            <th scope="col">Salida</th>
                            <th scope="col">Borrar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="registro in regestado1">
                            <td>{{ registro.nombre_propietario}}</td>
                            <td>{{ registro.placa_vehiculo}}</td>
                            <td>{{ registro.num_plaza}}</td>
                            <td>{{ registro.fecha_ingreso}}</td>
                            <td style="cursor: pointer">
                                <a class="btn color2" href="" aria-label="Sign Out" ng-click="actualizarRegistro(registro.id_registro_parqueo, registro.fecha_ingreso)" data-bs-toggle="modal" data-bs-target="#salidaModal">
                                    <i class="fa fa-sign-out" aria-hidden="true"></i>
                                </a>
                            </td>
                            <td style="cursor: pointer">
                                <a class="btn color3" href="" aria-label="Delete" ng-click="borrarRegistro(registro.id_registro_parqueo)" data-bs-toggle="modal" data-bs-target="#borrarModal">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">
                                REGISTRAR ENTRADA
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="mb-3">
                                    <label class="form-label" class="form-label">Nombre Propietario *</label>
                                    <input type="text" style="text-transform: capitalize;" required ng-model="nombre" class="form-control" placeholder="Nombre Propietario" aria-describedby="nombrePropietario"/>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">N??mero Identificaci??n *</label>
                                    <input type="text" required ng-model="documento" class="form-control" maxlength="11" placeholder="N??mero Identificaci??n" aria-describedby="nombrePropietario"/>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">N??mero Celular *</label>
                                    <input type="text" required ng-model="celular" class="form-control" maxlength="10" placeholder="N??mero Celular" aria-describedby="nombrePropietario"/>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Placa Veh??culo *</label>
                                    <input type="text" maxlength="7" required ng-model="placa" class="form-control" placeholder="Placa veh??culo" aria-describedby="nombrePropietario"/>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Plaza Aparcamiento *</label>
                                    <input type="number" required ng-model="plaza" class="form-control" placeholder="Placa veh??culo" aria-describedby="nombrePropietario"/>
                                </div>
                                <button type="submit" class="btn color1" ng-click="guardarRegistro()">Registrar</button>
                            </form>
                            <div id="respuesta"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="borrarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Eliminar Registro</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            ??Esta seguro que desea eliminar este registro?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn color2" data-bs-dismiss="modal"><strong> Cancelar </strong></button>
                            <button type="button" class="btn color3" aria-label="Delete" id="borrar"><strong> Eliminar </strong></button>
                        </div>
                    </div>
                    <div id="mensaje"></div>
                </div>
            </div>
            <div class="modal fade" id="salidaModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Dar Salida</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            ??Esta seguro que desea dar salida a este registro?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn color2" data-bs-dismiss="modal"><strong> Cancelar </strong></button>
                            <button type="button" class="btn color3" aria-label="Success" id="salida"><strong> Aceptar </strong></button>
                        </div>
                    </div>
                    <div id="menSalida"></div>
                </div>
            </div>
        </div>
        <script src="controladorRegistro.js"></script>
    </body>
</html>
