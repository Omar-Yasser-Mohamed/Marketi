import 'package:injectable/injectable.dart';

@lazySingleton
class EmailFlow {
  String? email;

  void clear() {
    email = null;
  }
}
