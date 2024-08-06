import 'package:estibafy_user/Views/pages/invoices/api/pdf_api.dart';
import 'package:estibafy_user/Views/pages/invoices/api/pdf_invoice_api.dart';
import 'package:estibafy_user/Views/pages/invoices/model/customer.dart';
import 'package:estibafy_user/Views/pages/invoices/model/invoice.dart';
import 'package:estibafy_user/models/invoices_model.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../drawer.dart';

class InvoicesDetail extends StatelessWidget {
  final Datum job;

  InvoicesDetail({
    Key? key,
    required this.job,
  }) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar2('Invoice', _scaffoldKey, context),
      key: _scaffoldKey,
      backgroundColor: K.secondaryColor,
      drawer: const SideDrawer(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Image(
                image: AssetImage('assets/estibafyfulllogo.jpeg'),
                width: 320,
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 05, bottom: 30),
                decoration: BoxDecoration(
                  border: Border.all(color: K.sixthColor),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Invoice #" + job.id.toString(),
                                  style: K.textStyle3
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Start Date : ${DateFormat('yy-MM-dd' '   @' 'kk:mm a').format(job.job!.startTime!)}",
                                  style: K.textStyle3,
                                ),
                                Text(
                                  "End Date : ${DateFormat('yy-MM-dd' '     @' 'kk:mm a').format(job.job!.endTime!)}",
                                  style: K.textStyle3,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 60,
                              width: 60,
                              child: IconButton(
                                  onPressed: () async {
                                    final invoice = Invoice(
                                      taxRate: job.taxRate!,
                                      subTotal: job.subTotal!,
                                      total: job.total!,
                                      customer: const Customer(
                                        name: 'Apple Inc.',
                                        address:
                                            'Apple Street, Cupertino, CA 95014',
                                      ),
                                      info: InvoiceInfo(
                                        startDate: DateFormat(
                                                'yy-MM-dd' '   @' 'kk:mm a')
                                            .format(job.job!.startTime!),
                                        endDate: DateFormat(
                                                'yy-MM-dd' '   @' 'kk:mm a')
                                            .format(job.job!.endTime!),
                                        // description: '',
                                        number: '#${job.jobId}',
                                      ),
                                      items: [
                                        InvoiceItem(
                                          description: 'Base Fare',
                                          // date: DateTime.now(),
                                          // quantity: 3,
                                          // vat: 0.19,
                                          unitPrice:
                                              double.parse(job.baseFare!),
                                        ),
                                        InvoiceItem(
                                          description:
                                              'Helpers (${job.totalHelpers})',
                                          // date: DateTime.now(),
                                          // quantity: 8,
                                          // vat: 0.19,
                                          unitPrice: job.totalHelpers! *
                                              double.parse(job.baseFare!),
                                        ),
                                        // InvoiceItem(
                                        //   description: 'Tax(12%)',
                                        //   // date: DateTime.now(),
                                        //   // quantity: 3,
                                        //   // vat: 0.19,
                                        //   unitPrice: double.parse(job.taxRate!),
                                        // ),
                                        // InvoiceItem(
                                        //   description: 'SUB-TOTAL',
                                        //   // date: DateTime.now(),
                                        //   // quantity: 3,
                                        //   // vat: 0.19,
                                        //   unitPrice:
                                        //       double.parse(job.subTotal!),
                                        // ),
                                      ],
                                    );
                                    final pdfFile =
                                        await PdfInvoiceApi.generate(invoice);

                                    PdfApi.openFile(pdfFile);
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.print,
                                    color: K.secondaryColor,
                                    size: 28,
                                  )),
                              decoration: BoxDecoration(
                                color: K.primaryColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: K.primaryColor.withOpacity(0.5),
                                    blurRadius: 9,
                                    offset:
                                        const Offset(4, 8), // Shadow position
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    divider(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Base Fare',
                                  style: K.textStyle3,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  '\$ ${job.baseFare}',
                                  style: K.textStyle3,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Helpers (${job.totalHelpers})',
                                  style: K.textStyle3,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  '\$ ${job.totalHelpers! * double.parse(job.baseFare!)}',
                                  style: K.textStyle3,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    divider(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tax (12%)',
                                  style: K.textStyle3,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  '\$  ${double.parse(job.subTotal!)*double.parse(job.taxRate!)/100}',
                                  style: K.textStyle3,
                                ),
                              ],
                            ),
                            divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'SUB-TOTAL',
                                  style: K.textStyle3,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  '\$ ${job.subTotal!}',
                                  style: K.textStyle3,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: K.primaryColor,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'TOTAL',
                              style: K.textStyle4,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              '\$${((double.parse(job.baseFare!) * job.totalHelpers!) + double.parse(job.subTotal!)*double.parse(job.taxRate!)/100).toStringAsFixed(2)}',
                              style: K.textStyle4
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  divider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Divider(
        color: K.tenthColor,
      ),
    );
  }
}
