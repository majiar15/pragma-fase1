import 'dart:math';

class UUIDUtils {
  static String generate() {
    final random = Random();

    final part1 = _generateRandomHex(random, 8);
    final part2 = _generateRandomHex(random, 4);
    final part3 = _generateRandomHex(random, 4);
    final part4 = _generateRandomHex(random, 4);
    final part5 = _generateRandomHex(random, 12);

    return '$part1-$part2-$part3-$part4-$part5';
  }

  static  String _generateRandomHex(Random random, int length) {
    const chars = '0123456789abcdef';
    return List.generate(length, (index) => chars[random.nextInt(16)]).join();
  }
}