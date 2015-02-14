//entry point for controller.html
//in charge of rendering the game pad
import 'dart:html';
import 'package:SocketTile/common.dart';
import 'package:SocketTileController/player.dart';


Player controller;
WebSocket ws;

void main(){
  querySelector('#connect').onClick.listen(connect);
  //TODO when deploying on mobile devices, change localhost to the ip of the server
  
  
}


void connect(MouseEvent event) {
  String ip=(querySelector('#ip') as InputElement).value;
  String port=(querySelector('#port')as InputElement).value;
  String server='ws://$ip:$port';
  querySelector('#controller').style.display="block";
  controller=new Player(server);
}
