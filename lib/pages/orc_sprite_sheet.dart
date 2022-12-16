import 'package:bonfire/bonfire.dart';

class OrcSprinteSheet {
  static  Future<SpriteAnimation> get idleLeft =>
      SpriteAnimation.load(

          'orc_idle_left.png',
          SpriteAnimationData.sequenced(
            amount: 3,
            stepTime: 0.25,
            textureSize: Vector2(32, 32),
            texturePosition: Vector2(-2,5),
          )

      );

  static Future<SpriteAnimation> get idleRight =>
      SpriteAnimation.load(

          'orc_idle_right.png',
          SpriteAnimationData.sequenced(
            amount: 2,
            stepTime: 0.25,
            textureSize: Vector2(32, 32),
            texturePosition: Vector2(-1,4),
          )

      );

  static Future<SpriteAnimation> get runRight =>
      SpriteAnimation.load(

          'orc_run_right.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.25,
            textureSize: Vector2(32, 32),
            texturePosition: Vector2(2,5),
          )

      );

  static Future<SpriteAnimation> get runLeft =>
      SpriteAnimation.load(

          'orc_run_left.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.25,
            textureSize: Vector2(32, 32),
            texturePosition: Vector2(0,0),
          )

      );

  static Future<SpriteAnimation> get receiveDamageRight =>
      SpriteAnimation.load(

          'orc_damaged_right.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(32, 32),
            texturePosition: Vector2(0,0),
          )

      );


  static Future<SpriteAnimation> get receiveDamageLeft =>
      SpriteAnimation.load(

          'orc_damaged_left.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(32, 32),
            texturePosition: Vector2(0,0),
          )

      );

  static Future<SpriteAnimation> get dieRight =>
      SpriteAnimation.load(

          'orc_die_right.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.2,
            textureSize: Vector2(32, 32),
            texturePosition: Vector2(0,0),
          )

      ); static Future<SpriteAnimation> get dieRleft =>
      SpriteAnimation.load(

          'orc_die_left.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.2,
            textureSize: Vector2(32, 32),
            texturePosition: Vector2(0,0),
          )

      );



}