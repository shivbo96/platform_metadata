import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_metadata/platform_metadata_method_channel.dart';

void main() {
  MethodChannelPlatformMetadata platform = MethodChannelPlatformMetadata();
  const MethodChannel channel = MethodChannel('platform_metadata');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return 'meta_data';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getMetaData', () async {
    expect(await platform.getMetaDataValue('mateDataName'), 'meta_data');
  });
}
