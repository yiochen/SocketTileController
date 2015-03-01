library player;
import 'dart:html';
import 'dart:convert';
import 'package:play_phaser/phaser.dart';
import 'package:SocketTile/common.dart';
import 'dart:async';
part 'src/states/cPlay.dart';
part 'src/objects/gamepad.dart';

WebSocket ws;
Game game;
String TAG='player';

class Player{
  int id;
  Player(String server){
    ws=new WebSocket(server);
       ws..onOpen.listen(
           (Event e){
             //don't sent anything yet, wait for the id assignment
             //ws.send(newConnM(TAG));
           }
       )
       ..onMessage.listen((MessageEvent e){
         Map map=JSON.decode(e.data);
         switch (map['message']){
           case m_idAssign:
             id=map[id];
             //send the newConnM to inform game client of the new controller connection
             ws.send(newConnM(TAG,id));
             break;
         }
       })
       ..onClose.listen((CloseEvent e){
         print('connection lost');
       });
       game=new Game(800,600,AUTO,'controller');
      //game=new Game(window.screen.available.width,window.screen.available.height,AUTO,'controller');
      
      game.state.add('play', new c_PlayState());
      game.state.start('play'); 
      
  }
}