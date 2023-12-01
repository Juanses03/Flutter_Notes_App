## Flutter Notas App

### Descripción del Proyecto

Este proyecto consiste en una aplicación móvil simple desarrollada con Flutter que permite a los usuarios visualizar y editar notas. La aplicación utiliza Firebase como backend para almacenar y sincronizar las notas en tiempo real.

### Tecnologías Utilizadas

- **Flutter:** Framework de desarrollo de aplicaciones móviles de código abierto.
- **Firebase:** Plataforma de desarrollo móvil de Google que ofrece una base de datos en tiempo real y servicios de autenticación.

### Funcionalidades Principales

1. **Vista de Notas:**
   - Visualización de todas las notas existentes con sus títulos.

2. **Editor de Notas:**
   - Funcionalidad para crear y editar el contenido de las notas.

### Estructura del Proyecto

```
flutter_notas_app/
|-- lib/
|   |-- main.dart
|   |-- models/
|       |-- note.dart
|   |-- screens/
|       |-- note_view.dart
|       |-- note_editor.dart
|-- pubspec.yaml
```

### Configuración de Firebase

- Se requiere la configuración de Firebase en el archivo `pubspec.yaml`.
- Se deben habilitar los servicios necesarios en la consola de Firebase.

### Ejecución del Proyecto

1. Asegúrate de tener Flutter y Dart instalados en tu máquina.
2. Clona este repositorio.
3. Configura tu proyecto en la consola de Firebase y actualiza las credenciales en el archivo `pubspec.yaml`.
4. Ejecuta `flutter pub get` para obtener las dependencias del proyecto.
5. Ejecuta `flutter run` para lanzar la aplicación en tu dispositivo o emulador.

Este proyecto simple proporciona una aplicación de notas básica con vistas y editores que se integran con Firebase para el almacenamiento en la nube.
