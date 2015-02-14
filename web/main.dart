//entry point for controller.html
//in charge of rendering the game pad
import 'dart:html';
import 'package:SocketTile/common.dart';
import 'package:SocketTileController/player.dart';


Player controller;
WebSocket ws;

void main(){
  //TODO when deploying on mobile devices, change localhost to the ip of the server
  String server='ws://192.168.1.4:$PORT';
  controller=new Player(server);
  
}
