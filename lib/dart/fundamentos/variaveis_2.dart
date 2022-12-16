main() {

  var n1 = 2;  //INFERI o tipo do valor da variavel 'a' = tipo inteiro
  var n2 = 4.56;  //INFERI o tipo do valor da variavel 'b' = tipo double
  var texto = 'O valor da Soma é: ';  //INFERI o tipo do valor da variavel 'b' = tipo double

  print(texto + (n1 + n2).toString());
  // O texto só é exibido com os demais valores após a conversão
  // dos valores usando o método {.toString()}


  //  var t1 = 'Ola';
  //  var t2 = ' Dart';
  //  print(t1+t2);
  // Concatena somente valores iguais (neste caso é TEXTO)


  print( n1.runtimeType);
  // este método {.runtimeType} exibe o tipo da variavel

  print( n1 is int);
  // esta é a outra forma de averiguar o tipo da variavel
  // neste caso a resposta é 'true' pq a variavel é do
  // tipo inteiro 'int'

}