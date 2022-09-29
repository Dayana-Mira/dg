
import 'dart:typed_data';
import 'dart:convert' as utf8;
import 'package:http/http.dart' as http;
import 'package:web_ldmsolutions/modelos/ObtenerRespuesta.dart';
import 'package:web_ldmsolutions/repository/IdentificadorInterface.dart';
import 'package:web_ldmsolutions/utils/compartido.dart';

class IdentificadorApi extends IdentificadorInterface{
  @override
  Future EnviarFoto(Uint8List foto) async{

    try{

      var solicitud = http.MultipartRequest("POST",Uri.parse(enviarFoto));

      solicitud.files.add(http.MultipartFile.fromBytes("foto", foto));

      var _respuesta =await solicitud.send();

      if(_respuesta.statusCode==200){
        var _objecto = await _respuesta.stream.transform(utf8.utf8.decoder).first;

        ObtenerRespuesta obtenerRespuesta  = ObtenerRespuesta.fromJson(utf8.json.decode(_objecto));
        return obtenerRespuesta;

      }else{
        return "Paso un error con la solicitud";
      }

    }
    catch(e){
      return "Paso un error con la solicitud";

    }



  }


}