import 'package:flutter_test/flutter_test.dart';
import 'package:platform_metadata/platform_metadata.dart';
import 'package:platform_metadata/platform_metadata_platform_interface.dart';
import 'package:platform_metadata/platform_metadata_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPlatformMetadataPlatform
    with MockPlatformInterfaceMixin
    implements PlatformMetadataPlatform {
  @override
  Future<String?> getMetaDataValue(metaDataName) => Future.value('meta_data');
}

void main() {
  final PlatformMetadataPlatform initialPlatform =
      PlatformMetadataPlatform.instance;

  test('$MethodChannelPlatformMetadata is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPlatformMetadata>());
  });

  test('getMetaData', () async {
    MockPlatformMetadataPlatform fakePlatform = MockPlatformMetadataPlatform();
    PlatformMetadataPlatform.instance = fakePlatform;

    expect(
        await PlatformMetadata.getMetaDataValue('metaDataName'), 'meta_data');
  });
}
