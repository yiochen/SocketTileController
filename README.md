SocketTileController
==========

This is a controller for the SocketTile game (wip). 
Installation
-------
Make sure you have pub installed. Open a command prompt, use


    pub build --all
   (I am actually not sure if this is necessary)

After it is finished, run

    pub serve --all --hostname=0.0.0.0
  to serve the page. 
  pub server will tell you something similar to this 
  

    Serving SocketTileController web on http://0.0.0.0:8080
 Note down the port number (in this case 8080)

  Find out the ip of your server, you can us command prompt *ipconfig* then find *IPv4 Address* under *Wireless LAN adapter Wi-Fi*
  Fire up your phone browser, direct to this address of this format http://the-ip-you-just-found:port-number
Connection
--------------
wait for all the assets are downloaded, this might take a while. Make sure you see 

    [web] GET /main.dart.js => SocketTileController|web/main.dart.js
 in the command prompt you used.
 Then enter the ip and the port of the web socket server that you use in the SocketTile project. Then connect.

Credit
-------
I use an awesome component-base entity system called Dartemis (https://github.com/denniskaselow/dartemis)
This game uses a dart game engine **play_phaser** (https://github.com/playif/play_phaser)