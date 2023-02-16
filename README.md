[![Pub](https://img.shields.io/pub/v/platform_metadata.svg)](https://pub.dartlang.org/packages/platform_metadata)

# platform_metadata

A flutter plugin which will help you to get metadata values defined in AndroidManifest.xml (Android) or info.plist (iOS).

Created by Shivam Mishra [@shivbo96](https://github.com/shivbo96)

# Usage

## Use this package as a library


1. Depend on it Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  platform_metadata: <VERSION>
```
2. Install it You can install packages from the command line:
   with Flutter:

```
$ flutter packages get
```

Alternatively, your editor might support flutter packages get. Check the docs for your editor to
learn more.

3. Import it Now in your Dart code, you can use:

```dart
import 'package:platform_metadata/platform_metadata.dart';
```

# Usage



```place inside your android manifest file```
```xml

<meta-data android:name="meta_key" android:value=" meta_value from android " />

```

```place inside your iOS info.plist```
```
<key>meta_key</key>
<string> meta_value from ios </string>
```

```dart

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

```

### for example refer to [example/lib/main.dart](https://github.com/shivbo96/platform_metadata)

## screenshots

<img src="https://raw.githubusercontent.com/shivbo96/platform_metadata/main/images/ios.png" width="250" height="480">
<img src="https://raw.githubusercontent.com/shivbo96/platform_metadata/main/images/android.png" width="250" height="480">
