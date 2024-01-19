import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_flavors/app.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App(flavor: 'Development', evmType: EvmType.dev));
}