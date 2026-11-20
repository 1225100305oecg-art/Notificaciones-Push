// Archivo placeholder para que el proyecto compile antes de ejecutar `flutterfire configure`.
// REEMPLÁZALO ejecutando `flutterfire configure` dentro de la carpeta `app/`.
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError('Ejecuta `flutterfire configure` para generar las credenciales reales.');
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'REEMPLAZAR_CON_FLUTTERFIRE_CONFIGURE',
    appId: '1:000000000000:android:0000000000000000',
    messagingSenderId: '000000000000',
    projectId: 'loteria-push-placeholder',
  );
}
