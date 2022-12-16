import 'package:bonfire/bonfire.dart';

class PlayerSprinteSheet {


  static Future<SpriteAnimation> get heroIdleLeft => SpriteAnimation.load(
      //'fHero_.png',
    'hero_idle_left.png',

      SpriteAnimationData.sequenced(
        //
        ////////////////////////////////////////////////
        // CONTA O TAMANHO DOS BLOCOS DENTRO DO SPRITE//
        ////////////////////////////////////////////////
        amount: 4,
        ////////////////////////////////////////////////
        // VELOCIDADE DO CONJUNTO DE SPRITES DO BLOCO //
        ////////////////////////////////////////////////
        stepTime: 0.15,
        ////////////////////////////////////////////////
        // VELOCIDADE DO CONJUNTO DE SPRITES DO BLOCO //
        ////////////////////////////////////////////////

      textureSize: Vector2(24,24),
        texturePosition: Vector2(0,0),

      ));

  static Future<SpriteAnimation> get heroIdleRight => SpriteAnimation.load(
      'hero_idle_right.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.15,
        textureSize: Vector2(24, 24),
        texturePosition: Vector2(0, 0),
      ));






  static Future<SpriteAnimation> get heroRunRight => SpriteAnimation.load(
      'hero_run_right.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.15,
        textureSize: Vector2(24, 24),
        texturePosition: Vector2(0,0),
      ));







  static Future<SpriteAnimation> get heroRunLeft => SpriteAnimation.load(
      'fHero_.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.15,
        textureSize: Vector2(24, 24),
        texturePosition: Vector2(96, 48),
      ));

  //

  /////////////////////////////////////////////////////////////


  static Future<SpriteAnimation> get receiveDamageRight => SpriteAnimation.load(

      /////////// DANO

      'hero_damage_rightx.png',
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.1,
        textureSize: Vector2(24, 24),
        texturePosition: Vector2(-3, -4),
      ));

  static Future<SpriteAnimation> get receiveDamageLeft => SpriteAnimation.load(

      /////////// DANO

      'hero_damage_leftx.png',
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.1,
        textureSize: Vector2(24, 24),
        texturePosition: Vector2(-3,-3),
      ));

  static Future<SpriteAnimation> get dieRight => SpriteAnimation.load(
      'hero_die_right.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.15,
        textureSize: Vector2(1, 1),
        texturePosition: Vector2(0, 0),
      ));

  static Future<SpriteAnimation> get dieRleft => SpriteAnimation.load(
      'hero_die_left.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 1.5,
        textureSize: Vector2(0, 0),
        texturePosition: Vector2(0, 0),
      ));



  //



  //



  static Future<SpriteAnimation> get attackLeft => SpriteAnimation.load(
      'espada1.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.1,
        textureSize: Vector2(32, 32),
         texturePosition: Vector2(8,0)

      ));

  static Future<SpriteAnimation> get attackRight => SpriteAnimation.load(
      'espada1.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.1,
        textureSize: Vector2(32, 32),
        texturePosition: Vector2(8,0)

      ));

  static Future<SpriteAnimation> get attackUp => SpriteAnimation.load(
      'espada1.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.1,
        textureSize: Vector2(32, 32),
        texturePosition: Vector2(1,1)

      ));

  static Future<SpriteAnimation> get attackDown => SpriteAnimation.load(
      'espada1.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.1,
        textureSize: Vector2(32, 32),
       texturePosition: Vector2(1,1)
      ));
}
