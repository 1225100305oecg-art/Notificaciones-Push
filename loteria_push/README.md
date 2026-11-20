# Lotería Push — Proyecto Completo (Servidor Node + App Flutter/Android)

Actividad práctica del manual **Lotería Push (Desarrollo Móvil Integral · UTNG)** con arquitectura TDD, notificaciones push mediante Firebase Cloud Messaging (FCM) y configuración Android lista para ejecutar en dispositivo físico.

---

## Estructura del proyecto

```text
loteria_push/
├── server/          # Servidor Node.js (sin dependencias externas para pruebas)
│   ├── baraja.js
│   ├── lineas.js
│   ├── mensajes.js
│   ├── sala.js
│   ├── enviador.js
│   ├── servidor.js
│   ├── package.json
│   └── test/        # 61 pruebas con node:test
└── app/             # Aplicación Flutter + configuración nativa Android
    ├── android/     # AndroidManifest, build.gradle.kts, MainActivity, recursos
    ├── lib/
    │   ├── dominio/
    │   ├── infra/
    │   ├── presentacion/
    │   ├── app.dart
    │   ├── main.dart
    │   └── firebase_options.dart
    ├── test/        # Pruebas unitarias y de widgets
    └── pubspec.yaml
```

---

## 1. Levantar el servidor Node (Cantor)

1. Abre una terminal en `server/`:
   ```bash
   cd server
   npm test    # Ejecuta las 61 pruebas TDD
   npm start   # Inicia el servidor en http://localhost:8080 (modo simulado)
   ```
2. **Para conectar con Firebase real:**
   ```bash
   npm install firebase-admin
   export GOOGLE_APPLICATION_CREDENTIALS=/ruta/segura/cuenta-de-servicio.json
   # En Windows PowerShell: $env:GOOGLE_APPLICATION_CREDENTIALS="C:\ruta\cuenta-de-servicio.json"
   FCM_REAL=1 npm start
   ```

---

## 2. Configurar y ejecutar en tu celular Android

1. **Generar archivos nativos faltantes de Flutter (si es necesario) y descargar dependencias:**
   ```bash
   cd app
   flutter create . --platforms=android --org mx.edu.utng
   flutter pub get
   ```
   *(Nota: El comando `flutter create .` regenerará los iconos `@mipmap/ic_launcher` y wrappers sin sobrescribir `lib/`, `test/` ni el `AndroidManifest.xml` ya configurado).*

2. **Conectar tu proyecto de Firebase:**
   - Crea un proyecto en [Firebase Console](https://console.firebase.google.com/).
   - Ejecuta dentro de `app/`:
     ```bash
     flutterfire configure
     ```
     Esto generará automáticamente `app/lib/firebase_options.dart` y colocará `app/android/app/google-services.json` con tus claves reales.

3. **Ejecutar pruebas de Flutter:**
   ```bash
   flutter test
   ```

4. **Correr en tu celular Android conectado por USB (Depuración USB activada):**
   - Asegúrate de que tu celular y tu computadora estén en la **misma red Wi-Fi**.
   - Obtén la IP local de tu computadora (`ipconfig` en Windows o `ifconfig`/`ip a` en Linux/macOS, ej. `192.168.1.50`).
   - Ejecuta la app pasando la IP de tu servidor:
     ```bash
     flutter run --dart-define=SERVIDOR=http://192.168.1.50:8080
     ```
   *(Si usas el emulador de Android en lugar de celular físico, puedes omitir `--dart-define` porque por defecto apunta a `http://10.0.2.2:8080`).*
