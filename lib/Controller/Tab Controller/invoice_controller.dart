import 'package:get/get.dart';

import '../../models/invoices_model.dart';

class InvoiceController extends GetxController {
  List<InvoiceModel> invoices = [];
  RxnString userId = RxnString();
}
