import 'package:json_annotation/json_annotation.dart';

part 'ObtenerRespuesta.g.dart';
@JsonSerializable()
class ObtenerRespuesta{
  bool esPitanga;

  ObtenerRespuesta(this.esPitanga);
  factory ObtenerRespuesta.fromJson(Map<String, dynamic> json) =>
      _$ObtenerRespuestaFromJson(json);
  Map<String, dynamic> toJson() => _$ObtenerRespuestaToJson(this);
}