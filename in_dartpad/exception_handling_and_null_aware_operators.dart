main() {
  // String myString = '15';
  String myString = 'abc';
  // myString + 5;

  try {
    double myStringAsADouble = double.parse(myString);
    print(myStringAsADouble + 5);
  } catch (execption) {
    print(execption);
  }

//  Null Aware Operator

  print(1 ?? 3);
  print(null ?? 12);
}
