import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:social_bucks/services/session.dart';

enum ConfigKeys {
  play_app_version
}

extension ConfigKeysX on ConfigKeys {
  String get getString  =>  FirebaseRemoteConfig.instance.getString(this.name); // NEW
  bool get getBool  => FirebaseRemoteConfig.instance.getBool(this.name); // NEW
  int get getInt  => FirebaseRemoteConfig.instance.getInt(this.name); // NEW
  double get getDouble  => FirebaseRemoteConfig.instance.getDouble(this.name); // NEW

}

class ConfigService {
  static ConfigService? _instance;
  static ConfigService get instance => _instance ?? ConfigService();

  Future<void> _setConfigSettings() async =>  FirebaseRemoteConfig.instance.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 12),
    ),
  );

  Future<void> _setDefaults() async =>  FirebaseRemoteConfig.instance.setDefaults(
     {
      ConfigKeys.play_app_version.name: Session.instance.packageInfo.version,
    },
  );

  Future<void> _fetchAndActivate() async {
    await FirebaseRemoteConfig.instance.fetchAndActivate();
  }

  Future<void> initialize () async {
    await _setConfigSettings();
    await _setDefaults();
    await _fetchAndActivate();
  }

  String getString(String key) =>  FirebaseRemoteConfig.instance.getString(key); // NEW
  bool getBool(String key) => FirebaseRemoteConfig.instance.getBool(key); // NEW
  int getInt(String key) => FirebaseRemoteConfig.instance.getInt(key); // NEW
  double getDouble(String key) => FirebaseRemoteConfig.instance.getDouble(key); // NEW
}