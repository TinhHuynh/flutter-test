import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  try {
    await integrationDriver(
      onScreenshot: (name, bytes, [args]) async {
        final File image =
            await File('screenshots/$name.png').create(recursive: true);
        image.writeAsBytesSync(bytes);
        return true;
      },
    );
  } catch (e) {
    // ignore: avoid_print
    print('Error occured: $e');
  }
}
