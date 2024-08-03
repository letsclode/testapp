import 'package:flutter/material.dart';
import 'package:my_app/app/app.dart';
import 'package:my_app/app/di.dart';
import 'package:my_app/app/provider/local_storage_provider.dart';
import 'package:my_app/bootstrap.dart';


void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  await _init();
  await  bootstrap(() => DI(child: const App()));
}

Future<void> _init() async {
  await _initLocalStorage();
}

Future<void> _initLocalStorage() async {
  await LocalStorageProvider.init();
}
