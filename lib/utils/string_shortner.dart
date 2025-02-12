String stringShortner({required String text, required int characterCount}) {
  return "${text.substring(0, characterCount)}...";
}
