// import 'package:estibafy_user/Controller/Tab%20Controller/home_controller.dart';
// import 'package:estibafy_user/models/utils/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:sizer/sizer.dart';
//
// class SearchBar extends StatelessWidget {
//   SearchBar({Key? key}) : super(key: key);
//
//   final HomeController _controller = Get.find(tag: K.homeControllerTag);
//   final FloatingSearchBarController _searchBarController =
//       FloatingSearchBarController();
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         Future.delayed(const Duration(milliseconds: 300), () {
//           if (_controller.address.value != null) {
//             _searchBarController.query = _controller.address.value!;
//           }
//           _searchBarController.open();
//         });
//
//         String? address = await showCustomModalBottomSheet(
//           context: context,
//           builder: (context) => Container(),
//           containerWidget: (
//             BuildContext context,
//             Animation<double> animation,
//             Widget widget,
//           ) =>
//               Scaffold(
//                 backgroundColor: Colors.transparent,
//                 body: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                         color: Colors.transparent,
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
//                       child: FloatingSearchBar(
//                         controller: _searchBarController,
//                         hint: 'Search Location...',
//                         backgroundColor: Colors.white,
//                         transitionDuration: const Duration(milliseconds: 300),
//                         transitionCurve: Curves.easeInOut,
//                         openAxisAlignment: 0.0,
//                         debounceDelay: const Duration(milliseconds: 300),
//                         onQueryChanged: (query) {
//                           if (query.isNotEmpty) {
//                             _controller.loading.value = true;
//                             _controller.autoCompleteSearch(query);
//                           }
//                         },
//                         hintStyle: const TextStyle(color: Colors.grey),
//                         backdropColor: Colors.transparent,
//                         transition: CircularFloatingSearchBarTransition(),
//                         builder: (context, transition) {
//                           return ClipRRect(
//                             borderRadius: BorderRadius?.circular(8),
//                             child: Material(
//                               elevation: 4.0,
//                               child: Obx(
//                                 () => _controller.loading.value
//                                     ? SizedBox(
//                                         height: 40.h,
//                                         child: const Center(
//                                           child: CircularProgressIndicator(),
//                                         ),
//                                       )
//                                     : _controller.predictions.isEmpty
//                                         ? SizedBox(
//                                             height: 40.h,
//                                             child: Center(
//                                               child: Image.asset(
//                                                   "assets/powered_by_google.png"),
//                                             ),
//                                           )
//                                         : ListView.builder(
//                                             shrinkWrap: true,
//                                             itemCount:
//                                                 _controller.predictions.length,
//                                             itemBuilder: (context, index) {
//                                               return Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                         vertical: 5.0),
//                                                 child: ListTile(
//                                                   onTap: () {
//                                                     Navigator.pop(
//                                                       context,
//                                                       _controller.predictions
//                                                           .elementAt(index)
//                                                           .description!,
//                                                     );
//                                                   },
//                                                   leading: const Icon(
//                                                     Icons.location_on_outlined,
//                                                     color: Colors.black,
//                                                   ),
//                                                   title: Text(
//                                                     _controller.predictions
//                                                         .elementAt(index)
//                                                         .description!,
//                                                     style: const TextStyle(
//                                                       fontSize: 14,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               );
//                                             },
//                                           ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//         );
//
//         if (address == null) {
//           return;
//         }
//
//         _controller.address.value = address;
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(right: 20, left: 5),
//         child: Obx(
//           () => TextField(
//             enabled: false,
//             decoration: InputDecoration(
//               contentPadding:
//                   const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//               border: InputBorder.none,
//               hintText: _controller.address.value ?? 'Enter Location...',
//               hintStyle: TextStyle(
//                 fontSize: 14,
//                 color:
//                     _controller.address.value == null ? null : Colors.black,
//               ),
//               prefixIcon: Icon(
//                 Icons.location_on,
//                 color: K.primaryColor,
//                 size: 20,
//               ),
//               suffixIcon: Icon(
//                 FontAwesomeIcons.locationArrow,
//                 color: K.primaryColor,
//                 size: 16,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
