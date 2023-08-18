import 'package:flutter/material.dart';
import 'package:flutter_application_6/screens/qr_overlay.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;

              for (final barcode in barcodes) {
                debugPrint('Barcode found! ${barcode.rawValue}');
              }
            },
          ),
          QRScannerOverlay(
            overlayColour: Colors.black.withOpacity(0.4),
          ),
        ],
      ),
    );
  }
}
