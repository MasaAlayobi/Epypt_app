import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> saveFile(dynamic response, String fileName) async {
  try {
    // Request storage permission
    var permissionStatus = await Permission.storage.request();
    if (!permissionStatus.isGranted) {
      print("Storage permission denied");
      return;
    }
    Directory? directory;

    // Determine the correct directory based on platform
    if (Platform.isAndroid) {
      // Get external storage directory
      directory = await getExternalStorageDirectory();
      print(directory);
      if (directory == null) {
        // Fallback to application documents directory
        directory = await getApplicationDocumentsDirectory();
        print(directory);
      }

      // Create the mufraty directory if it doesn't exist
      String mufratyPath = join(directory.path, "mufraty");
      Directory mufratyDir = Directory(mufratyPath);
      if (!mufratyDir.existsSync()) {
        await mufratyDir.create(recursive: true);
      }
      print(mufratyDir);
      // Save file to the mufraty directory
      String filePath = join(mufratyDir.path, fileName);
      File file = File(filePath);
      await file.writeAsBytes(response);
      print("File saved at: $filePath");
    } else {
      // Handle iOS or other platforms
      directory = await getApplicationDocumentsDirectory();
      String mufratyPath = join(directory.path, "mufraty");
      Directory mufratyDir = Directory(mufratyPath);
      if (!mufratyDir.existsSync()) {
        await mufratyDir.create(recursive: true);
      }

      String filePath = join(mufratyDir.path, fileName);
      File file = File(filePath);
      await file.writeAsBytes(response);
      print("File saved at: $filePath");
      directory = await getExternalStorageDirectory();
      print(directory);
      directory = await getApplicationDocumentsDirectory();
      print(directory);
    }
  } catch (e) {
    print("Error: ${e.toString()}");
  }
}
/////////////////////////////////////////////////////////
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
// import 'package:permission_handler/permission_handler.dart';

// Future<void> saveFile(dynamic response, String fileName) async {
//   try {
//     // Request storage permission
//     var permissionStatus = await Permission.storage.request();
//     if (!permissionStatus.isGranted) {
//       print("Storage permission denied");
//       return;
//     }

//     // Determine the correct directory based on platform
//     Directory? directory;
//     if (Platform.isAndroid) {
//       directory = await getExternalStorageDirectory();
//       if (directory == null) {
//         print("External storage directory not available");
//         return;
//       }
//     } else {
//       directory = await getApplicationDocumentsDirectory();
//     }

//     // Create 'mufraty' directory under the chosen directory
//     String mufratyPath = join(directory.path, "mufraty");
//     Directory mufratyDir = Directory(mufratyPath);
//     if (!mufratyDir.existsSync()) {
//       await mufratyDir.create(recursive: true);
//     }

//     // Save file to the mufraty directory
//     String filePath = join(mufratyDir.path, fileName);
//     File file = File(filePath);
//     await file.writeAsBytes(response);

//     print("File saved at: $filePath");
//   } catch (e) {
//     print("Error: ${e.toString()}");
//   }
// }
