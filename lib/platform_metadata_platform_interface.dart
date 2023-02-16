import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'platform_metadata_method_channel.dart';

abstract class PlatformMetadataPlatform extends PlatformInterface {
  /// Constructs a PlatformMetadataPlatform.
  PlatformMetadataPlatform() : super(token: _token);

  static final Object _token = Object();

  static PlatformMetadataPlatform _instance = MethodChannelPlatformMetadata();

  /// The default instance of [PlatformMetadataPlatform] to use.
  ///
  /// Defaults to [MethodChannelPlatformMetadata].
  static PlatformMetadataPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PlatformMetadataPlatform] when
  /// they register themselves.
  static set instance(PlatformMetadataPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getMetaDataValue(String mateDataName) {
    throw UnimplementedError('getMetaData() has not been implemented.');
  }
}
