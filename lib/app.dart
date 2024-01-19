import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

enum EvmType { pro, dev }

class App extends StatefulWidget {
  const App({super.key, required this.flavor, required this.evmType});

  final String flavor;
  final EvmType evmType;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final int _counter = 0;
  late DatabaseReference _counterRef;
  late DatabaseReference _messagesRef;

  static final _app = Firebase.app();
  static final _databaseDev = FirebaseDatabase.instanceFor(app: _app, databaseURL: "https://flavors-dev-db3f8-default-rtdb.asia-southeast1.firebasedatabase.app");
  static final _databasePro = FirebaseDatabase.instanceFor(app: _app, databaseURL: "https://flavors-pro-f16f1-default-rtdb.asia-southeast1.firebasedatabase.app");

  @override
  void initState() {
    _initDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.flavor),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(top: 40),
          child: MaterialButton(
            color: Colors.blue,
            onPressed: _incrementDev,
            child: Text( widget.evmType == EvmType.dev ? 'Dev add' : 'Pro add', style: const TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }

  Future<void> _incrementDev() async {
    await _counterRef.set(ServerValue.increment(1));
    await _messagesRef.push().set(<String, String>{'Hello': 'world! $_counter'});
  }

  void _initDatabase() {
    if(widget.evmType == EvmType.dev){
      _messagesRef = _databaseDev.ref('messages');
      _counterRef = _databaseDev.ref('counter');
      return;
    }

    _messagesRef = _databasePro.ref('messages');
    _counterRef = _databasePro.ref('counter');
  }
}
