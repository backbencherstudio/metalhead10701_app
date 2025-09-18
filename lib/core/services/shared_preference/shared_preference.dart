import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<void> setToken(String? token) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('auth_token', token ?? "No Token");
  }

  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('auth_token');
  }

  // EMAIL
  Future<String?> getEmailId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  Future<void> setEmailId(String? id) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('email', id ?? "No email_id");
  }

  Future<void> removeEmailId() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
  }

  // GAME ID
  Future<String?> getGameId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('game_id');
  }

  Future<void> setGameId(String? id) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('game_id', id ?? "No game_id");
  }

  Future<void> removeGameId() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('game_id');
  }

}