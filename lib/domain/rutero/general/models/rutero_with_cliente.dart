import 'dart:convert';

import 'package:uma/domain/rutero/general/models/cliente.dart';
import 'package:uma/domain/rutero/general/models/rutero.dart';

RuteroWithCliente ruteroWithClienteFromJson(String str) => RuteroWithCliente.fromJson(json.decode(str));

String ruteroWithClienteToJson(RuteroWithCliente data) => json.encode(data.toJson());

class RuteroWithCliente {
  RuteroWithCliente({
    this.codigoCliente,
    this.codigoDia,
    this.orden,
    this.frecuencia,
    this.nombreRuta,
    this.codigoProveedor,
    this.apellido1,
    this.apellido2,
    this.barrio,
    this.bloqueado,
    this.bodegaCliente,
    this.canal,
    this.centroSuministro,
    this.ciudad,
    this.clasificacionCiudad,
    this.clasificacionCliente,
    this.clasificacionFiscal,
    this.clienteDescuento,
    this.codigo,
    this.codigoCanal,
    this.codigoCentroSuministro,
    this.codigoCiudad,
    this.codigoClienteSap,
    this.codigoCondPago,
    this.codigoDepto,
    this.codigoDireccion,
    this.codigoListaProducto,
    this.codigoOficinaVenta,
    this.codigoOrgVentas,
    this.codigoPostal,
    this.codigoSubCanal,
    this.codigoTipoDocumento,
    this.codigoTipologia,
    this.codigoUbicacion,
    this.codigoUsuarioSys,
    this.codigoZonaVentas,
    this.condicionPago,
    this.cupoCred,
    this.departamento,
    this.descripcionCondPago,
    this.descripcionDepartamento,
    this.digitoVerif,
    this.direccion,
    this.documento,
    this.email,
    this.fechaCreacion,
    this.grupoClientes,
    this.latitud,
    this.longitud,
    this.marketShare,
    this.nombreCliente,
    this.nombreEstablecimiento,
    this.oficinaVenta,
    this.orgVentas,
    this.razonSocial,
    this.subCanal,
    this.telefono,
    this.tipoDocumento,
    this.tipologia,
  });

  String? codigoCliente;
  int? codigoDia;
  String? orden;
  String? frecuencia;
  String? nombreRuta;
  int? codigoProveedor;
  String? apellido1;
  String? apellido2;
  String? barrio;
  int? bloqueado;
  String? bodegaCliente;
  String? canal;
  String? centroSuministro;
  String? ciudad;
  String? clasificacionCiudad;
  String? clasificacionCliente;
  String? clasificacionFiscal;
  double? clienteDescuento;
  String? codigo;
  String? codigoCanal;
  String? codigoCentroSuministro;
  String? codigoCiudad;
  String? codigoClienteSap;
  String? codigoCondPago;
  String? codigoDepto;
  String? codigoDireccion;
  String? codigoListaProducto;
  String? codigoOficinaVenta;
  String? codigoOrgVentas;
  String? codigoPostal;
  String? codigoSubCanal;
  String? codigoTipoDocumento;
  String? codigoTipologia;
  String? codigoUbicacion;
  String? codigoUsuarioSys;
  String? codigoZonaVentas;
  String? condicionPago;
  double? cupoCred;
  String? departamento;
  String? descripcionCondPago;
  String? descripcionDepartamento;
  String? digitoVerif;
  String? direccion;
  String? documento;
  String? email;
  String? fechaCreacion;
  String? grupoClientes;
  double? latitud;
  double? longitud;
  String? marketShare;
  String? nombreCliente;
  String? nombreEstablecimiento;
  String? oficinaVenta;
  String? orgVentas;
  String? razonSocial;
  String? subCanal;
  String? telefono;
  String? tipoDocumento;
  String? tipologia;


  factory RuteroWithCliente.fromJson(Map<String, dynamic> json) =>
      RuteroWithCliente(
        codigoCliente: json["CodigoCliente"],
        codigoDia: json["CodigoDia"],
        orden: json["orden"],
        frecuencia: json["Frecuencia"],
        nombreRuta: json["NombreRuta"],
        codigoProveedor: json["CodigoProveedor"],
        apellido1: json["Apellido1"],
        apellido2: json["Apellido2"],
        barrio: json["Barrio"],
        bloqueado: json["Bloqueado"],
        bodegaCliente: json["BodegaCliente"],
        canal: json["Canal"],
        centroSuministro: json["CentroSuministro"],
        ciudad: json["Ciudad"],
        clasificacionCiudad: json["ClasificacionCiudad"],
        clasificacionCliente: json["ClasificacionCliente"],
        clasificacionFiscal: json["ClasificacionFiscal"],
        clienteDescuento: json["ClienteDescuento"].toDouble(),
        codigo: json["Codigo"],
        codigoCanal: json["CodigoCanal"],
        codigoCentroSuministro: json["CodigoCentroSuministro"],
        codigoCiudad: json["CodigoCiudad"],
        codigoClienteSap: json["CodigoClienteSap"],
        codigoCondPago: json["CodigoCondPago"],
        codigoDepto: json["CodigoDepto"],
        codigoDireccion: json["CodigoDireccion"],
        codigoListaProducto: json["CodigoListaProducto"],
        codigoOficinaVenta: json["CodigoOficinaVenta"],
        codigoOrgVentas: json["CodigoOrgVentas"],
        codigoPostal: json["CodigoPostal"],
        codigoSubCanal: json["CodigoSubCanal"],
        codigoTipoDocumento: json["CodigoTipoDocumento"],
        codigoTipologia: json["CodigoTipologia"],
        codigoUbicacion: json["CodigoUbicacion"],
        codigoUsuarioSys: json["CodigoUsuarioSys"],
        codigoZonaVentas: json["CodigoZonaVentas"],
        condicionPago: json["CondicionPago"],
        cupoCred: json["CupoCred"].toDouble(),
        departamento: json["Departamento"],
        descripcionCondPago: json["DescripcionCondPago"],
        descripcionDepartamento: json["DescripcionDepartamento"],
        digitoVerif: json["DigitoVerif"],
        direccion: json["Direccion"],
        documento: json["Documento"],
        email: json["Email"],
        fechaCreacion: json["FechaCreacion"],
        grupoClientes: json["GrupoClientes"],
        latitud: json["Latitud"].toDouble(),
        longitud: json["Longitud"].toDouble(),
        marketShare: json["MarketShare"],
        nombreCliente: json["NombreCliente"],
        nombreEstablecimiento: json["NombreEstablecimiento"],
        oficinaVenta: json["OficinaVenta"],
        orgVentas: json["OrgVentas"],
        razonSocial: json["RazonSocial"],
        subCanal: json["SubCanal"],
        telefono: json["Telefono"],
        tipoDocumento: json["TipoDocumento"],
        tipologia: json["Tipologia"],
      );

  Map<String, dynamic> toJson() => {
        "CodigoCliente": codigoCliente,
        "CodigoDia": codigoDia,
        "orden": orden,
        "Frecuencia": frecuencia,
        "NombreRuta": nombreRuta,
        "CodigoProveedor": codigoProveedor,
        "Apellido1": apellido1,
        "Apellido2": apellido2,
        "Barrio": barrio,
        "Bloqueado": bloqueado,
        "BodegaCliente": bodegaCliente,
        "Canal": canal,
        "CentroSuministro": centroSuministro,
        "Ciudad": ciudad,
        "ClasificacionCiudad": clasificacionCiudad,
        "ClasificacionCliente": clasificacionCliente,
        "ClasificacionFiscal": clasificacionFiscal,
        "ClienteDescuento": clienteDescuento,
        "Codigo": codigo,
        "CodigoCanal": codigoCanal,
        "CodigoCentroSuministro": codigoCentroSuministro,
        "CodigoCiudad": codigoCiudad,
        "CodigoClienteSap": codigoClienteSap,
        "CodigoCondPago": codigoCondPago,
        "CodigoDepto": codigoDepto,
        "CodigoDireccion": codigoDireccion,
        "CodigoListaProducto": codigoListaProducto,
        "CodigoOficinaVenta": codigoOficinaVenta,
        "CodigoOrgVentas": codigoOrgVentas,
        "CodigoPostal": codigoPostal,
        "CodigoSubCanal": codigoSubCanal,
        "CodigoTipoDocumento": codigoTipoDocumento,
        "CodigoTipologia": codigoTipologia,
        "CodigoUbicacion": codigoUbicacion,
        "CodigoUsuarioSys": codigoUsuarioSys,
        "CodigoZonaVentas": codigoZonaVentas,
        "CondicionPago": condicionPago,
        "CupoCred": cupoCred,
        "Departamento": departamento,
        "DescripcionCondPago": descripcionCondPago,
        "DescripcionDepartamento": descripcionDepartamento,
        "DigitoVerif": digitoVerif,
        "Direccion": direccion,
        "Documento": documento,
        "Email": email,
        "FechaCreacion": fechaCreacion,
        "GrupoClientes": grupoClientes,
        "Latitud": latitud,
        "Longitud": longitud,
        "MarketShare": marketShare,
        "NombreCliente": nombreCliente,
        "NombreEstablecimiento": nombreEstablecimiento,
        "OficinaVenta": oficinaVenta,
        "OrgVentas": orgVentas,
        "RazonSocial": razonSocial,
        "SubCanal": subCanal,
        "Telefono": telefono,
        "TipoDocumento": tipoDocumento,
        "Tipologia": tipologia,
      };
}
