typedef CheatCode = List<CheatInput>;

class CheatInput {
  final int? score;

  const CheatInput._() : score = null;

  static const help = CheatInput._();

  const CheatInput.score(int this.score);

  @override
  bool operator ==(Object other) =>
      (other is CheatInput) && (score == other.score);

  @override
  int get hashCode => score.hashCode;

  @override
  String toString() {
    if (score == null) return '<help>';
    return '<score: $score>';
  }
}
