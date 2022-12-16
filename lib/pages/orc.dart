import 'dart:ui';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:my_2d_game/main.dart';
import '../player_sprite_sheet.dart';
import 'orc_sprite_sheet.dart';
import 'package:my_2d_game/hero.dart';

class Orc extends SimpleEnemy with ObjectCollision {
  // VARIAVEL PARA FAZER O ORC CONGELAR
  // POR MEIO SEGUNDO ASSIM QUE RECEBER O HIT

  bool canMove = true;

  Orc(Vector2 position)
      : super(
            /////////////////////////////////////////
            // CONFIGURA TAMANHO INIMIGO/SPRITE//////
            /////////////////////////////////////////
            size: Vector2(tileSize * 2, tileSize * 2),

            /////////////////////////////////////////
            // CONFIGURA VELOCIDADE DO INIMIGO //////
            /////////////////////////////////////////
            speed: 115,
            position: position,
            /////////////////////////////////////////
            // ADICIONA ANIMACAO DO INIMIGO /////////
            /////////////////////////////////////////
            animation: SimpleDirectionAnimation(
              idleLeft: OrcSprinteSheet.idleLeft,
              idleRight: OrcSprinteSheet.idleRight,
              runLeft: OrcSprinteSheet.runLeft,
              runRight: OrcSprinteSheet.runRight,
            )) {
    ///////////////////////////
    // CONFIGURA COLISAO //////
    ///////////////////////////
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(
        /////////////////////////////////////////
        // CONFIGURA TAMANHO BLOCO COLISAO //////
        /////////////////////////////////////////
        size: Vector2(25, 30),

        /////////////////////////////////////////
        //////// ALINHA  BLOCO COLISAO //////////
        /////////////////////////////////////////
        align: Vector2(28, 18),
      )
    ]));
  }

  ///////////////////////////////////////////////
  // BUSCA O PLAYER NO CAMPO DE VISAO 'RADIUS' //
  ///////////////////////////////////////////////
  @override
  void update(double dt) {
    if (canMove) {
      seeAndMoveToPlayer(
        closePlayer: (player) {
          _executeAttack();
        },
        radiusVision: tileSize * 8,
      );
    }
    super.update(dt);
  }

///////////////////////////////////////////////
//// RENDER / DESENHAR A VIDA DO 'ORC' /////
///////////////////////////////////////////////
  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(
      canvas,
      borderWidth: 5,
      align: const Offset(20, 0),
      height: 12,
      width: 39,
    );
    super.render(canvas);
  }

  /////////////////////////////////////////////////////////
  //// REMOVE INIMIGO DO MAPA ASSIM QUE ACABAR A VIDA /////
  /////////////////////////////////////////////////////////
  @override
  void die() {
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(OrcSprinteSheet.dieRleft, runToTheEnd: true,
          onFinish: () {
        removeFromParent();
      });
    } else {
      // MÉTODO USADO PARA COLOCAR ANIMAÇÃO QDO O 'ORC' RECEBER DANO
      //LADO DIREITO
      animation?.playOnce(OrcSprinteSheet.dieRight, runToTheEnd: true,
          onFinish: () {
        removeFromParent();
      });
    }
    super.die();
  }

  // MÉTODO USADO PARA COLOCAR ANIMAÇÃO QDO O 'ORC' RECEBER DANO
  //LADO ESQUERDO
  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    canMove = false;
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(OrcSprinteSheet.receiveDamageLeft, runToTheEnd: true,
          onFinish: () {
        canMove = true;
      });
    } else {
      // MÉTODO USADO PARA COLOCAR ANIMAÇÃO QDO O 'ORC' RECEBER DANO
      //LADO DIREITO
      animation?.playOnce(OrcSprinteSheet.receiveDamageRight, runToTheEnd: true,
          onFinish: () {
        canMove = true;
      });
    }
    super.receiveDamage(attacker, damage, identify);
  }

  void _executeAttack() {
    simpleAttackMelee(
      damage: 0.1,
      size: Vector2(40, 40),
      withPush: false,

      /// ANIMAÇÃO USADA NA HORA QUE O ATAQUE OCORRER
      animationRight: PlayerSprinteSheet.attackRight,
    );
  }
}
