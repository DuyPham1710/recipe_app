class Helper {
  static List<String> parseInstructions(String instructions) {
    final steps = instructions
        .split(RegExp(r'[.!?]|\n'))
        .map((step) => step.trim())
        .where((step) => step.isNotEmpty)
        .toList();

    return steps;
  }
}
