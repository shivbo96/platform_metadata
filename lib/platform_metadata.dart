
import 'platform_metadata_platform_interface.dart';

class PlatformMetadata {
  static Future<String?> getMetaDataValue(String metaDataName) {
    return PlatformMetadataPlatform.instance.getMetaDataValue(metaDataName);
  }
}
