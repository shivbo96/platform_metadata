import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:platform_metadata/platform_metadata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _metaDataValue = '';

  @override
  void initState() {
    getMetaData();
    super.initState();
  }

  Future<void> getMetaData() async {
    String metaDataValue;
    try {
      metaDataValue = await PlatformMetadata.getMetaDataValue('meta_key') ?? '';
    } on PlatformException {
      metaDataValue = 'Failed to get metaDataValue.';
    }
    if (!mounted) return;

    setState(() {
      _metaDataValue = metaDataValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Meta Data Example'),
        ),
        body: Center(
          child: Text('MetaData value: $_metaDataValue\n'),
        ),
      ),
    );
  }
}