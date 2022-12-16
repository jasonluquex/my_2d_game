main() {

  int n1 = 3;

  double n2 = (-5.67).abs();

  double n3 = double.parse('12.765');
  // podemos imprimir valores tipo double vindo de string
  // usando o método double.parse

  num n4 = 6;


  // print( n3 is double);


  print(n1.abs() + n2 + n3 + n4);
  // tbm podemos fazer calculos dos dados que foram ''parseados''


  String s1 = 'Bom ';
  String s2 = 'dia';

  print(s1 + s2.toUpperCase() + '!!!');

}
