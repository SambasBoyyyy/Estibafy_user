import 'package:estibafy_user/Views/pages/invoices/model/customer.dart';

class Invoice {
  final InvoiceInfo info;

  final Customer customer;
  final List<InvoiceItem> items;
  final String taxRate;
  final String subTotal;
  final String total;

  const Invoice({
    required this.taxRate,
    required this.subTotal,
    required this.total,
    required this.info,
    required this.customer,
    required this.items,
  });
}

class InvoiceInfo {
  // final String description;
  final String number;
  final String startDate;
  final String endDate;

  const InvoiceInfo({
    // required this.description,
    required this.number,
    required this.startDate,
    required this.endDate,
  });
}

class InvoiceItem {
  final String description;

  // final DateTime date;
  // final int quantity;
  // final double vat;
  final double? unitPrice;

  const InvoiceItem({
    required this.description,
    // required this.date,
    // required this.quantity,
    // required this.vat,
    required this.unitPrice,
  });
}
