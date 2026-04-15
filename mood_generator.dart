import 'dart:io';
import 'dart:math';

// Перечисление настроений
enum Mood {
  happy,
  sad,
  angry,
  sleepy,
  excited,
}

// Расширение для добавления свойств к enum
extension MoodInfo on Mood {
  String get emoji {
    switch (this) {
      case Mood.happy:
        return '\u{1F600}'; // 😀
      case Mood.sad:
        return '\u{1F622}'; // 😢
      case Mood.angry:
        return '\u{1F620}'; // 😠
      case Mood.sleepy:
        return '\u{1F634}'; // 😴
      case Mood.excited:
        return '\u{1F929}'; // 🤩
    }
  }

  String get description {
    switch (this) {
      case Mood.happy:
        return 'Счастливое';
      case Mood.sad:
        return 'Грустное';
      case Mood.angry:
        return 'Злое';
      case Mood.sleepy:
        return 'Сонное';
      case Mood.excited:
        return 'Воодушевленное';
    }
  }

  int get energy {
    switch (this) {
      case Mood.happy:
        return 8;
      case Mood.sad:
        return 3;
      case Mood.angry:
        return 7;
      case Mood.sleepy:
        return 2;
      case Mood.excited:
        return 10;
    }
  }
}

void main() {
  // Имя пользователя
  stdout.write('Введите ваше имя: ');
  String name = stdin.readLineSync() ?? 'Гость';

  // Случайное настроение
  var random = Random();
  Mood mood = Mood.values[random.nextInt(Mood.values.length)];

  // Вывод результата
  print('\nПривет, $name!');
  print(
      'Твое настроение: ${mood.emoji} ${mood.description} (энергия: ${mood.energy}/10)');

  // Вывод Unicode (кодовая точка)
  int codePoint = mood.emoji.runes.first;
  print('Unicode эмодзи: U+${codePoint.toRadixString(16).toUpperCase()}');

  // Анализ сложных эмодзи
  stdout.write('\nХочешь проанализировать эмодзи? (да/нет): ');
  String answer = stdin.readLineSync() ?? '';

  if (answer.toLowerCase() == 'да') {
    stdout.write('Введи строку с эмодзи: ');
    String input = stdin.readLineSync() ?? '';

    print('\nАнализ строки:');

    // 16-битные единицы
    print('Количество 16-битных единиц: ${input.codeUnits.length}');

    // Кодовые точки
    print('Количество кодовых точек: ${input.runes.length}');

    // "Реальные" символы (приближенно через runes)
    print('Количество символов: ${input.runes.length}');

    print('\nUnicode каждого символа:');
    for (var rune in input.runes) {
      print('U+${rune.toRadixString(16).toUpperCase()}');
    }
  }

  print('\nГотово!');
}
