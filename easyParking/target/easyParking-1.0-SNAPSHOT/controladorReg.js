/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* global angular */

var ingreso = new Date();
var fechaIngreso = ingreso.getFullYear() + '-' + (ingreso.getMonth() + 1) + '-' + ingreso.getDate() + ' ' + ingreso.getHours() + ':' + ingreso.getMinutes() + ':' + ingreso.getSeconds();

var app = angular.module('easyParking', []);
app.controller('controladorRegistro', function ($scope, $http) {
    $scope.guardarRegistro = function () {
        if ($scope.nombre === undefined || $scope.documento === undefined) {
            alert('Campos obligatorios');
        } else {
            let rex = /[A-Za-z]{3}[-]([0-9]{3}|[0-9]{2}[A-Za-z]{1})/i;
            if (rex.test($scope.placa)) {
                let registro = {
                    proceso: "guardarRegistro",
                    fecha_ingreso: fechaIngreso,
                    num_plaza: $scope.plaza,
                    estado: 1,
                    nombre_propietario: $scope.nombre,
                    doc_propietario: $scope.documento,
                    cel_propietario: $scope.celular,
                    placa_vehiculo: $scope.placa
                };
                $http({
                    method: 'POST',
                    url: 'peticionesRegistro.jsp',
                    params: registro
                }).then(function (respuesta) {
                    console.log(respuesta);
                    document.getElementById("respuesta").innerHTML = "<br><div class='alert color1'>Registro Exitoso</div>";
                    setTimeout(function () {
                        location.reload();
                    }, 1000);
                });
            } else {
                document.getElementById("respuesta").innerHTML = "<br><div class='alert color3'>Placa inválida</div>";    
            };
        };
    };
    $scope.listarRegistros = function () {
        console.log('Listar Registros');
        let params = {
            proceso: 'listarRegistros'
        };
        $http({
            method: 'POST',
            url: 'peticionesRegistro.jsp',
            params: params
        }).then(function (respuesta) {
            $scope.regestado1 = respuesta.data.Registros.filter(element => element.estado === 1);
            $scope.regestado0 = respuesta.data.Registros;
            console.log($scope.regestado0);
            console.log($scope.regestado1);
        });
    };
    $scope.borrarRegistro = function (id_registro) {
        let borrar = document.querySelector('#borrar');
        borrar.addEventListener('click', () => {
            let params = {
                proceso: 'borrarRegistro',
                id_registro: id_registro
            };
            $http({
                method: 'POST',
                url: 'peticionesRegistro.jsp',
                params: params
            }).then(function (respuesta) {
                console.log(respuesta);
                document.getElementById("mensaje").innerHTML = "<br><div class='alert color3'>Registro Eliminado</div>";
                setTimeout(function () {
                    location.reload();
                }, 800);
            });
        });
    };
    $scope.actualizarRegistro = function (id_registro, fecha_ingreso) {
        let salida = document.querySelector('#salida');
        salida.addEventListener('click', () => {
            let salida = new Date();
            let fechaSalida = salida.getFullYear() + '-' + (salida.getMonth() + 1) + '-' + salida.getDate() + ' ' + salida.getHours() + ':' + salida.getMinutes() + ':' + salida.getSeconds();
            let tiempo = parseInt((Date.parse(fechaSalida) - Date.parse(fecha_ingreso)) / 60000);
            console.log(tiempo);
            let params = {
                proceso: 'actualizarRegistro',
                id_registro: id_registro,
                fecha_salida: fechaSalida,
                estado: 0,
                tiempo_parqueo: tiempo,
                valor_parqueo: tiempo * 100
            };
            $http({
                method: 'POST',
                url: 'peticionesRegistro.jsp',
                params: params
            }).then(function (respuesta) {
                console.log(respuesta);
                document.getElementById("menSalida").innerHTML = "<br><div class='alert color2'><h4>Salida Exitosa</h4><strong>Fecha Ingreso: </strong>" + fecha_ingreso + "<br><strong>Fecha Salida: </strong>" + fechaSalida + "<br><strong>Tiempo Parqueo: </strong>" + tiempo + " min.<br><strong>Valor Parqueo: </strong>$" + tiempo * 100 + "</div>";
                setTimeout(function () {
                    location.reload();
                }, 5000);
            });
        });
    };
    $scope.ingresar = function () {
        let usuario = "easyParking";
        let clave = "admin2021";
        if ($scope.usuario === undefined || $scope.clave === undefined) {
            alert('Campos obligatorios');
        } else {
            if ($scope.usuario === usuario && $scope.clave === clave) {
                sessionStorage.setItem('usuarioact', usuario);
                document.getElementById("respuesta").innerHTML = "<br><div class='alert alert-success'>Ingreso exitoso</div>";
                window.location.href = 'inicio.jsp';
            } else {
                document.getElementById("respuesta").innerHTML = "<br><div class='alert alert-danger'>Datos incorrectos</div>";
            }
            ;
        }
        ;
    };
    $scope.cerrarSesion = function () {
        sessionStorage.removeItem('usuarioact');
        window.location.href = 'index.jsp';
    };
});