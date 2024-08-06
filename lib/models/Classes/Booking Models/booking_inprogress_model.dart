class BookingsInProgressModel {
  String orderNumber;
  String address;
  String startDate, endDate;
  String startTime, endTime;
  String helpers;
  String containerSize;
  String packing;
  String totalPrice;

  BookingsInProgressModel({
    required this.orderNumber,
    required this.address,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.helpers,
    required this.containerSize,
    required this.packing,
    required this.totalPrice,
  });
}

class BookingsInProgressList {
  static List<BookingsInProgressModel> list = [
    BookingsInProgressModel(
      orderNumber: '23456678',
      address: '8998 North West 42 Terr Miami, Florida 33172',
      startDate: 'Nov 7, 2021',
      endDate: 'Nov 7, 2021',
      startTime: '8:00 AM',
      endTime: '8:00 AM',
      helpers: '6',
      containerSize: '20 Feet',
      packing: 'Boxes, Pallets, Sacos',
      totalPrice: '392.00',
    ),
    BookingsInProgressModel(
      orderNumber: '23456678',
      address: '8998 North West 42 Terr Miami, Florida 33172',
      startDate: 'Nov 7, 2021',
      endDate: 'Nov 7, 2021',
      startTime: '8:00 AM',
      endTime: '8:00 AM',
      helpers: '6',
      containerSize: '20 Feet',
      packing: 'Boxes, Pallets, Sacos',
      totalPrice: '392.00',
    ),
  ];
}
