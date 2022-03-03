import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_provisioning/in_app_provisioning.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  InAppProvisioning provisioning = InAppProvisioning();
  bool _canUsePassKit = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    bool isPasskitAvailable;
    try {
      isPasskitAvailable = await provisioning.isPasskitAvailable ?? false;
    } on PlatformException {
      isPasskitAvailable = false;
    }

    if (!mounted) return;

    setState(() {
      _canUsePassKit = isPasskitAvailable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text(_canUsePassKit
              ? "This device can use Passkit"
              : "This device cannot use passkit"),
        ),
      ),
    );
  }
}
