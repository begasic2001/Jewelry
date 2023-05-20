// import 'package:app_trang_suc/components/appColors/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class HistoryProductWidget extends StatelessWidget {
//   final String? productImage;
//   final String? productName;
//   final int? productPrice;
//   final int? productQuantity;
//   final int? totalPrice;
//   //final String? date_order;
//   HistoryProductWidget({
//     this.productImage,
//     this.productName,
//     this.productPrice,
//     this.productQuantity,
//     this.totalPrice,
//     //this.date_order,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         height: 140,
//         child: Column(
//           children: [
//             Expanded(
//               flex: 2,
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: Padding(
//                       padding: EdgeInsets.all(12.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.0),
//                             image: DecorationImage(
//                               image: NetworkImage(productImage!),
//                             )),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 10.0, vertical: 20.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: const [
//                               Text(
//                                 "3 Nhẫn ",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: AppColors.baseBlackColor,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 "150000 VNĐ",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: AppColors.baseBlackColor,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: const [
//                               Text(
//                                 "Nguyên Khối",
//                                 style: TextStyle(
//                                   color: AppColors.baseDarkPinkColor,
//                                 ),
//                               ),
//                               Text(
//                                 "100000 VNĐ",
//                                 style: TextStyle(
//                                   decoration: TextDecoration.lineThrough,
//                                   fontSize: 16,
//                                   color: AppColors.baseBlackColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Text(
//                             "Màu Sắc:\tVàng",
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: AppColors.baseGrey60Color,
//                             ),
//                           ),
//                           Text(
//                             "Số Lượng:\tx1",
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: AppColors.baseGrey60Color,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//  // children: [
//   //         Container(
//   //           margin: EdgeInsets.only(bottom: 10.0),
//   //           color: AppColors.baseWhiteColor,
//   //           child: Column(
//   //             children: [
//   //               Card(
//   //                 child: Container(
//   //                   height: 140,
//   //                   child: Column(
//   //                     children: [
//   //                       Expanded(
//   //                         flex: 2,
//   //                         child: Row(
//   //                           children: [
//   //                             Expanded(
//   //                               flex: 1,
//   //                               child: Padding(
//   //                                 padding: EdgeInsets.all(12.0),
//   //                                 child: Container(
//   //                                   decoration: BoxDecoration(
//   //                                       borderRadius:
//   //                                           BorderRadius.circular(10.0),
//   //                                       image: DecorationImage(
//   //                                         image: NetworkImage(
//   //                                             "https://kickz.akamaized.net/en/media/images/p/600/adidas_originals-3_STRIPES_T_Shirt-white_-2.jpg"),
//   //                                       )),
//   //                                 ),
//   //                               ),
//   //                             ),
//   //                             Expanded(
//   //                               flex: 2,
//   //                               child: Container(
//   //                                 padding: EdgeInsets.symmetric(
//   //                                     horizontal: 10.0, vertical: 20.0),
//   //                                 child: Column(
//   //                                   crossAxisAlignment:
//   //                                       CrossAxisAlignment.start,
//   //                                   mainAxisAlignment:
//   //                                       MainAxisAlignment.spaceEvenly,
//   //                                   children: [
//   //                                     Row(
//   //                                       mainAxisAlignment:
//   //                                           MainAxisAlignment.spaceBetween,
//   //                                       children: const [
//   //                                         Text(
//   //                                           "3 Nhẫn ",
//   //                                           style: TextStyle(
//   //                                             fontSize: 16,
//   //                                             color: AppColors.baseBlackColor,
//   //                                             fontWeight: FontWeight.bold,
//   //                                           ),
//   //                                         ),
//   //                                         Text(
//   //                                           "150000 VNĐ",
//   //                                           style: TextStyle(
//   //                                             fontSize: 16,
//   //                                             color: AppColors.baseBlackColor,
//   //                                             fontWeight: FontWeight.bold,
//   //                                           ),
//   //                                         ),
//   //                                       ],
//   //                                     ),
//   //                                     Row(
//   //                                       mainAxisAlignment:
//   //                                           MainAxisAlignment.spaceBetween,
//   //                                       children: const [
//   //                                         Text(
//   //                                           "Nguyên Khối",
//   //                                           style: TextStyle(
//   //                                             color:
//   //                                                 AppColors.baseDarkPinkColor,
//   //                                           ),
//   //                                         ),
//   //                                         Text(
//   //                                           "100000 VNĐ",
//   //                                           style: TextStyle(
//   //                                             decoration:
//   //                                                 TextDecoration.lineThrough,
//   //                                             fontSize: 16,
//   //                                             color: AppColors.baseBlackColor,
//   //                                           ),
//   //                                         ),
//   //                                       ],
//   //                                     ),
//   //                                     Text(
//   //                                       "Màu Sắc:\tVàng",
//   //                                       style: TextStyle(
//   //                                         fontSize: 16,
//   //                                         color: AppColors.baseGrey60Color,
//   //                                       ),
//   //                                     ),
//   //                                     Text(
//   //                                       "Số Lượng:\tx1",
//   //                                       style: TextStyle(
//   //                                         fontSize: 16,
//   //                                         color: AppColors.baseGrey60Color,
//   //                                       ),
//   //                                     )
//   //                                   ],
//   //                                 ),
//   //                               ),
//   //                             ),
//   //                           ],
//   //                         ),
//   //                       ),
//   //                     ],
//   //                   ),
//   //                 ),
//   //               )
//   //             ],
//   //           ),
//   //         ),
//   //       ],

