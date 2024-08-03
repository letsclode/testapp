import 'package:my_app/app/app.dart';
import 'package:my_app/app/di.dart';
import 'package:my_app/bootstrap.dart';

void main() {
  bootstrap(() => const DI(child: App()));
}
