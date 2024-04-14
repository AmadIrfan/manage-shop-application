import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class GenerateCsv extends StatelessWidget {
  const GenerateCsv({super.key});

  void generateCsv() async {
    // List<List<String>> data = [
    //   ["No.", "Name", "Roll No."],
    //   ["1", 'asd', 'asd'],
    //   ["2", 'sad', 'sd'],
    //   ["3", 'aas', 'asd']
    // ];

    // if (await Permission.manageExternalStorage.request().isGranted &&
    //     await Permission.storage.request().isGranted) {
    // String csvData = const ListToCsvConverter().convert(data);
    final Directory directory = await getApplicationDocumentsDirectory();
    final path = "$directory/csv-${DateTime.now()}.csv";
    if (kDebugMode) {
      print(directory);
      print(path);

      final File file = File(path);
      // await file.writeAsString(csvData);
      if (file.existsSync()) {
        print('exist');
      } else {
        file.create(recursive: true);
      }
      debugPrint('created');
    } else {
      debugPrint('not granted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await Permission.manageExternalStorage.request();
        await Permission.storage.request();
        await Permission.storage.shouldShowRequestRationale;

        generateCsv();
      },
      child: const Text('Generate Item'),
    );
  }
}
