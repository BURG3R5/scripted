import 'package:shared_preferences/shared_preferences.dart';

import '../constants/enums/game.dart';

class LocalStorageService {
  static late LocalStorageService _instance;
  static late SharedPreferences _preferences;

  static const String scoreKey = 'SCORE';

  static const String levelKey = 'LEVEL';

  static const String hasUnlockedMenuKey = 'HAS_UNLOCKED_MENU';

  static const String hasUnlockedGame3Key = 'HAS_UNLOCKED_GAME_3';

  static Future<LocalStorageService> getInstance() async {
    _instance = LocalStorageService();
    _preferences = await SharedPreferences.getInstance();
    return _instance;
  }

  dynamic _getFromDisk(String key) {
    final value = _preferences.get(key);
    return value;
  }

  void _saveToDisk<T>(String key, T content) {
    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }

  List<int> get score {
    if (!_preferences.containsKey(scoreKey)) {
      _saveToDisk(scoreKey, List.filled(7, 0).join(','));
    }

    return (_getFromDisk(scoreKey)! as String)
        .split(',')
        .map(int.parse)
        .toList();
  }

  List<int> get level {
    if (!_preferences.containsKey(levelKey)) {
      _saveToDisk(levelKey, List.filled(7, 0).join(','));
    }

    return (_getFromDisk(levelKey)! as String)
        .split(',')
        .map(int.parse)
        .toList();
  }

  void setGameScore({required Game game, required int newScore}) {
    final updatedScore = List.from(score);
    updatedScore[game.index] = newScore;
    final scoreString = updatedScore.join(',');
    _saveToDisk(scoreKey, scoreString);
  }

  void setGameLevel({required Game game, required int newLevel}) {
    final updatedLevel = List.from(level);
    updatedLevel[game.index] = newLevel;
    final levelString = updatedLevel.join(',');
    _saveToDisk(levelKey, levelString);
  }

  bool get hasUnlockedMenu => _getFromDisk(hasUnlockedMenuKey) ?? false;

  set hasUnlockedMenu(bool hUM) {
    _saveToDisk(hasUnlockedMenuKey, hUM);
  }

  bool get hasUnlockedGame3 => _getFromDisk(hasUnlockedGame3Key) ?? false;

  set hasUnlockedGame3(bool hUG3) {
    _saveToDisk(hasUnlockedGame3Key, hUG3);
  }
}
