import 'package:dig_mobile_app/app/designsystem/ds_scan_qr_code.dart';
import 'package:flutter/material.dart';

class ScanQrCodePage extends StatefulWidget {
  const ScanQrCodePage({Key? key}) : super(key: key);

  @override
  State<ScanQrCodePage> createState() => _ScanQrCodePageState();
}

class _ScanQrCodePageState extends State<ScanQrCodePage> {

  @override
  Widget build(BuildContext context) {
    return const DSScanQrCode();
  }
}
