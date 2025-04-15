import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'platform_metadata_platform_interface.dart';

/// An implementation of [PlatformMetadataPlatform] that uses method channels.
class MethodChannelPlatformMetadata extends PlatformMetadataPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('platform_metadata');

  @override
  Future<dynamic> getMetaDataValue(String mateDataName) async {
    final metaDataValue = await methodChannel.invokeMethod<dynamic>(
      'getMetaData',
      mateDataName,
    );
    return metaDataValue;
  }
}
