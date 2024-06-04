import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../Core/Config/widget/Titles.dart';

Future saveFile(dynamic response, String fileName) async {
  // where response is the file data from api ex: bytes data
  try {
    Directory? tempDir;

    if (Platform.isAndroid) {
      tempDir = await getExternalStorageDirectory();

      String newPath = "";
      List<String> folders = tempDir!.path.split("/");

      for (var i = 1; i < folders.length; i++) {
        String folder = folders[i];
        if (folder != "Android") {
          newPath += "/" + folder;
          print(newPath);
        } else {
          break;
        }
      }
      String mufratyPath = join(newPath, "mufraty");
      Directory muframtyDir = Directory(mufratyPath);

      if (!muframtyDir.existsSync()) {
        await muframtyDir.create(recursive: true);
      }

      String filePath = join(muframtyDir.path, fileName);

      print(filePath);
      File file = File(filePath);
      await file.writeAsBytes(response);
    } else {
      Directory? tempDir2 = await getApplicationDocumentsDirectory();
      print(tempDir2.path);
      String mufratyPath = join(tempDir2.path, "mufraty");
      Directory muframtyDir = Directory(mufratyPath);

      if (!muframtyDir.existsSync()) {
        await muframtyDir.create(recursive: true);
      }

      String filePath = join(muframtyDir.path, fileName);

      print(filePath);
      File file = File(filePath);
      await file.writeAsBytes(response);
    }

    // }
  } catch (e) {
    print(e.toString());
  }
}
