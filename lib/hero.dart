import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:my_2d_game/main.dart';
import 'player_sprite_sheet.dart';

class GameHero extends SimplePlayer with ObjectCollision {

  bool canMove = true;

  GameHero(Vector2 position)
      : super(
    ///////////////////////////
    // TAMANHO SPRITE PLAYER //
    ///////////////////////////
    size: Vector2(62, 62),
    position: position,
    //
    //
    ///////////////////////////
    // CONFIG DE ANIMACAO  //
    ///////////////////////////
    animation: SimpleDirectionAnimation(

      //IDLE
      idleLeft: PlayerSprinteSheet.heroIdleLeft,
      idleRight: PlayerSprinteSheet.heroIdleRight,

      //RUN
      runUpRight: PlayerSprinteSheet.heroRunRight,
      runUpLeft: PlayerSprinteSheet.heroRunLeft,
      runDownLeft: PlayerSprinteSheet.heroRunLeft,
      runDownRight:PlayerSprinteSheet.heroRunRight,
      runRight: PlayerSprinteSheet.heroRunRight,
      runLeft: PlayerSprinteSheet.heroRunLeft,


    ),
    speed: 220,
  ) {
    //
    ///////////////////////////
    // CONFIGURAR COLISAO // //
    ///////////////////////////
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            ///////////////////////////
            // TAMANHO BLOCO COLISAO //
            ///////////////////////////
              size: Vector2(tileSize - 8, tileSize - 12),

              /////////////////////////////////////////////////
              // ALINHAMENTO AREA DE COLISAO JUNTO AO SPRITE //
              /////////////////////////////////////////////////
              align: Vector2(13, 22)),
        ],
      ),
    );
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN && event.id == 1) {
      executeAttack();
    }

    super.joystickAction(event);
  }


  /// Travar o Hero qdo ele receber algum hit
  ///
  void joystickChangeDirectional(JoystickDirectionalEvent event){
    if (canMove){
      super.joystickChangeDirectional(event);
    }
  }



  /// METODO PARA CONFIGURAR O ATAQUE DO PLAYER

  void executeAttack() {
    simpleAttackMelee(
      damage: 25,
      size: Vector2(50, 50),
      centerOffset: Vector2(-10, -10),
      withPush: true,

      /// ANIMAÇÃO USADA NA HORA QUE O ATAQUE OCORRER
      animationRight: PlayerSprinteSheet.attackRight,

    );
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }

  // MÉTODO USADO PARA COLOCAR ANIMAÇÃO QDO O 'ORC' RECEBER DANO
  //LADO ESQUERDO
  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    canMove = false;
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(
        PlayerSprinteSheet.receiveDamageLeft,
        runToTheEnd: true,
        onFinish: () {
          canMove = true;
        },);
    } else {
      // MÉTODO USADO PARA COLOCAR ANIMAÇÃO QDO O 'ORC' RECEBER DANO
      //LADO DIREITO
      animation?.playOnce(
        PlayerSprinteSheet.receiveDamageRight,
        runToTheEnd: true,
        onFinish: () {
          canMove = true;
        },
      );
    }
super.receiveDamage(attacker, damage, identify);
  }

}
// METÓDO QUE VERIFICA SE O PLAYER COLIDIU COM ALGUM OBJETO
// OU ALGUM OBJETO COLIDIU COM O PLAYER

// @override
// bool onCollision(GameComponent component, bool active) {
//   print(component);
//   print(active);
//   return super.onCollision(component, active);
// //
