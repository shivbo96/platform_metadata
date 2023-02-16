
import 'platform_metadata_platform_interface.dart';

class PlatformMetadata {
  Future<String?> getPlatformVersion() {
    return PlatformMetadataPlatform.instance.getPlatformVersion();
  }
}
