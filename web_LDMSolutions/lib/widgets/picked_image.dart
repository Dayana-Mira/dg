import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:web_ldmsolutions/repository/IdentificadorApi.dart';

class PickedImage extends StatefulWidget {
  final Uint8List imagen;

  const PickedImage({required this.imagen});
  @override
  State<PickedImage> createState() => _PickedImageState();
}
bool? _pitanga;
bool _estaCargando= false;
class _PickedImageState extends State<PickedImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xff21a179),
          title: const Text('ENVIAR FOTO')),
      body: Column(
        children: [
          Center(child: Image.memory(widget.imagen)),
          _pitanga==null?Container():Center(child: Text("${_pitanga==false?"No es pitanga":"Es pitanga"}")),

          _estaCargando?SpinKitWave(size: 50.0,)
              :ElevatedButton(onPressed: ()async{
            setState((){
              _estaCargando=true;
            });
            IdentificadorApi api = new IdentificadorApi();
            dynamic pitanga=await api.EnviarFoto(widget.imagen);
            if(pitanga is bool){
              setState((){
                _pitanga=pitanga;
                _estaCargando=false;

              });

            }else{
              setState((){
                _estaCargando=false;
              });
            }
            print("click");
          }, child: Text("ENVIAR"))
        ],
      ),

    );
  }
}
