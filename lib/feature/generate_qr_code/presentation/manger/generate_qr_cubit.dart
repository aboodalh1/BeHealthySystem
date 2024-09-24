import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:qrreader/core/widgets/custom_snack_bar/custom_snack_bar.dart';

part 'generate_qr_state.dart';

class GenerateQrCubit extends Cubit<GenerateQrState> {
  GenerateQrCubit() : super(GenerateQrcubitInitial());
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController bagIDController = TextEditingController();
  bool isGenerateQr = false;
  String ?qrData;
  GlobalKey globalKey = GlobalKey();

  Future<void> printContainer() async {
    RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();
    final pdf = pw.Document();
    final imagePdf = pw.MemoryImage(pngBytes);
    final imagePdfPage = pw.Page(
        build: (pw.Context context) => pw.Center(child: pw.Image(imagePdf)));
    pdf.addPage(imagePdfPage);

    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
  }
  void generateQr(context){
    if(customerNameController.text.isEmpty||bagIDController.text.isEmpty){
        customSnackBar(context, 'Both field are required');
    }
    else {
      qrData =
      'Customer: ${customerNameController.text}, Bag ID: ${bagIDController
          .text}';
      isGenerateQr = true;
      emit(GenerateNewQrState());
    }}
  void clearQr(){
    customerNameController.clear();
    bagIDController.clear();
    isGenerateQr=false;
    emit(ClearQrState());
  }

}
