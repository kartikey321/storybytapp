import 'package:uuid/uuid.dart';

class Utils {
  static String generateUniqueId() {
    var uuid = const Uuid();
    return uuid.v4();
  }
}
