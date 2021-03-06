//controller play.dart
part of player;

class c_PlayState extends State{
  Gamepad gamepad;
  StreamSubscription touchSub;
  StreamSubscription releaseSub;
  StreamSubscription changeSub;
  
  @override
  preload(){
    
  }
  @override
  create(){

    addGamePad();
    handleInput();

  }
  
  void handleInput() {
    game.input.onDown.add(onTouchDown);
    game.input.onUp.add(onTouchUp);
  }
  
  void addGamePad() {
    gamepad=new Gamepad(game, 200,150);
    game.add.existing(gamepad);
    touchSub=gamepad.onEvent.where((val)=>val==Gamepad.TOUCHED).listen((val)=>ws.send(startMoveM(TAG,player.id)));
    releaseSub=gamepad.onEvent.where((val)=>val==Gamepad.RELEASE).listen((val)=>ws.send(endMoveM(TAG,player.id)));
    changeSub=gamepad.onEvent.where((val)=>val==Gamepad.CHANGE_DIR).listen((val)=>ws.send(newDirM(TAG,gamepad.dir,player.id)));
  }
  @override
  update(){
    gamepad.update();
   
  }
//  @override
//  render(){
//    game.debug.pointer(game.input.mousePointer);
//    game.debug.pointer(game.input.pointers[1]);
//    game.debug.pointer(game.input.pointers[2]);
//  }
//  
  void onTouchDown(Pointer pointer, dynamic event) {
    if (gamepad.within(pointer.x,pointer.y)){
      gamepad.touchdown(pointer);
    }
  }
  
  void onTouchUp(Pointer pointer, dynamic event) {
    if (gamepad.pointer==pointer){
      gamepad.release();
    }
  }
  @override
  shutdown(){
    game.input.onDown.removeAll();
    game.input.onUp.removeAll();
    touchSub.cancel();
    releaseSub.cancel();
    changeSub.cancel();
//    game.stage.removeChildren();
  }
}