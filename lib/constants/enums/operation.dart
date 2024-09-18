enum Operation {
  add('/'),
  subtract(r'\'),
  multiply('//'),
  divide(r'\\'),
  raiseTo('///');

  final String symbol;

  const Operation(this.symbol);

  @override
  String toString() => symbol;
}
