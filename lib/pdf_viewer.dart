import 'package:flutter/material.dart';
import 'package:open_pdf/file_pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewer extends StatefulWidget {
  const PDFViewer({super.key});

  @override
  State<PDFViewer> createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FilePDF()));
                setState(() {
                  isOpen = true;
                });
                debugPrint("tapp");
              },
              icon: Icon(Icons.image),
              label: Text(
                "Lihat File",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                style: ButtonStyle(backgroundColor:
                    MaterialStateProperty.resolveWith((states) {
                  if (!isOpen) {
                    return Colors.grey; // Disabling the button
                  }
                  return Colors.blue; // Enabling the button
                })),
                onPressed: () {
                  if (isOpen) {
                    debugPrint("save");
                  }
                },
                child: Text("Accept", style: TextStyle(color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
