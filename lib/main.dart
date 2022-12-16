import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
import 'package:my_2d_game/hero.dart';
import 'pages/orc.dart';

final double tileSize = 42;

main() {


  ///////////////////////////////////////
  // FORÇA A APLICAÇÃO ABRIR EM PORTRAIT
  ///////////////////////////////////////
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

//  int tileSized = 32;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BonfireWidget(
          //  cameraConfig: CameraConfig(zoom: 80),
          autofocus: true,

          ///////////////////////////
          // JOYSTICK / CONTROLE ////
          ///////////////////////////
          joystick: Joystick(
            directional: JoystickDirectional(
              color: Colors.amber,
              //  margin: EdgeInsets.all(40),
            ),
            actions: [
              ////////////////////////////////
              // JOYSTICK BOTAO DE ATAQUE ////
              ////////////////////////////////
              JoystickAction(
                actionId: 1,
                color: Colors.amber,
                margin: EdgeInsets.all(50),
              )
            ],
          ),

          ///////////////////////////
          ///////   MAPA   //////////
          ///////////////////////////
          map: WorldMapByTiled(
            'map/island.json',
            forceTileSize: Vector2(tileSize, tileSize),
            //
            //
            /////////////////////////////////////////
            // ADICIONA OBJETOS AO MAPA...//// //////
            /////////////////////////////////////////
            objectsBuilder: {
              'orc': (properties) => Orc(
                    properties.position,
                  ),
            },
          ),

          ///////////////////////////
          //Posição do player no mapa
          ///////////////////////////
          player: GameHero(
            Vector2(130, 1450),
          ),
          //showCollisionArea: true,

          ///////////////////////////
          ////// CONFIG CAMERA //////
          ///////////////////////////
          cameraConfig: CameraConfig(
              sizeMovementWindow: Vector2(
                tileSize * 1,
                tileSize * 1,
              ),
              //zoom: 5,
              moveOnlyMapArea: true),

          ///////////////////////////
          ////// COMPONENTES ////////
          ///////////////////////////
          components: [],
        ),
      ),
    );
  }
}
