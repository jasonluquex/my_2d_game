import 'dart:io';

main() {

  // Área da circunferência = pi * raio * raio

  final PI = 3.1415;

  stdout.write('Informe o valor do Raio. ');

  final entradaDoUsuario = stdin.readLineSync();
  // armazena o que o usuario digitou dentro desta var entradaDoUsuario

  final double raio = double.parse(entradaDoUsuario!);
  // pega o q o user digitou e converte para o tipo Double
  // a palavra 'final' é reservada para definir CONSTANTE

  var area = PI * raio * raio;
  // armazena o valor da area calculando as constantes acima + o q
  // user digitou 'entradaDoUsuario'

  print('O valor da área é: ' + area.toString());
  // imprime o q o valor convertendo-o para String

}