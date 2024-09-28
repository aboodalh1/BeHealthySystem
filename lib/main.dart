import 'package:flutter/material.dart';
import 'package:qrreader/core/util/app_router.dart';
import 'package:qrreader/core/util/service_locator.dart';
import 'package:qrreader/feature/Auth/presentation/view/sign_in_page.dart';
import 'package:qrreader/feature/customers/presentation/view/customer_page_view.dart';
import 'package:qrreader/feature/home_page/presentation/view/home_page.dart';
import 'package:qrreader/feature/users/presentation/view/users_page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRoutes.routes,
      theme: ThemeData(
        fontFamily: 'Mono',
            scaffoldBackgroundColor: const Color(0xffF8F9FB)
      ),
      home: const SignInPage(),
    );
  }
}

//
// class QRCodeScannerApp extends StatefulWidget {
//   const QRCodeScannerApp({super.key});
//
//   @override
//   _QRCodeScannerAppState createState() => _QRCodeScannerAppState();
// }
//
// class _QRCodeScannerAppState extends State<QRCodeScannerApp> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode? result;
//   QRViewController? controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             flex: 5,
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: _onQRViewCreated,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: (result != null)
//                   ? Text('Barcode Type:  Data: ${result!.code}')
//                   : const Text('Scan a code'),
//             ),
//           ),
//           Text('${result?.code}'),
//         ],
//       ),
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
