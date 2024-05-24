// // import 'package:easy_localization/easy_localization.dart';

// // import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';

// // class DiscountsPage extends StatelessWidget {
// //   const DiscountsPage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Directionality(
// //       textDirection: TextDirection.rtl,
// //       child: Logo());
// //   }
// // }

// class MyCustomForm extends StatefulWidget {
//   const MyCustomForm({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _MyCustomFormState createState() => _MyCustomFormState();
// }

// class _MyCustomFormState extends State<MyCustomForm> {
//   final TextEditingController _controller = TextEditingController();

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != DateTime.now()) {
//       setState(() {
//         String formattedDate =
//             '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
//         _controller.text = formattedDate;

//         //  _controller.text = DateFormat('yyyy-MM-dd').format(picked);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Container(
//         constraints: const BoxConstraints(
//           maxWidth: 100,
//           maxHeight: 50,
//         ),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8), color: Colors.white),
//         child: TextFormField(
//           textAlign: TextAlign.center,
//           controller: _controller,
//           decoration: const InputDecoration(
//               border: InputBorder.none,
//               hintText: 'أدخل التاريخ',
//               hintFadeDuration: Duration(),
//               hintStyle: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 12,
//               )),
//           readOnly: true,
//           onTap: () {
//             _selectDate(context);
//           },
//         ),
//       ),
//     );
//   }
// }

// class DiscountsPage extends StatefulWidget {
//   const DiscountsPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _LogoState createState() => _LogoState();
// }

// class _LogoState extends State<DiscountsPage> {
//   List<Widget> logoWidgets = [];

//   void _addLogoBody() {
//     setState(() {
//       logoWidgets.add(const LogoBody());
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         floatingActionButton: FloatingActionButton(
//           onPressed: _addLogoBody,
//           backgroundColor: Colors.red,
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(16.0)),
//           ),
//           child: const Icon(
//             Icons.add,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor:  Color.fromARGB(136, 224, 214, 214),
//         appBar: AppBar(
//           backgroundColor: Colors.red,
//           centerTitle: true,
//           title: const Text(
//             'LOGO',
//             style: TextStyle(color: Colors.white),
//           ),
//           leading: const Icon(
//             Icons.person_outlined,
//             color: Colors.white,
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               ...logoWidgets,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class LogoBody extends StatelessWidget {
//   const LogoBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: const Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             RowWithText(),
//             SizedBox(height: 16),
//             DateRow(),
//             SizedBox(height: 16),
//             CustomFormRow(),
//             SizedBox(height: 16),
//             ConfirmButton(),
//             SizedBox(height: 16),
//             CustomDivider(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RowWithText extends StatelessWidget {
//   const RowWithText({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Row(
//         children: [
//           const Spacer(),
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: Colors.white,
//             ),
//             child: const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text('قيمة الفاتورة'),
//             ),
//           ),
//           const Spacer(),
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: Colors.white,
//             ),
//             child: const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text('قيمة الخصم'),
//             ),
//           ),
//           const Spacer(),
//         ],
//       ),
//     );
//   }
// }

// class DateRow extends StatelessWidget {
//   const DateRow({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: const Row(
//         children: [
//           Spacer(),
//           Text('بدءاً من تاريخ'),
//           Spacer(),
//           Text('حتى تاريخ'),
//           Spacer(),
//         ],
//       ),
//     );
//   }
// }

// class CustomFormRow extends StatelessWidget {
//   const CustomFormRow({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: const Row(
//         children: [
//           Spacer(),
//           MyCustomForm(),
//           Spacer(),
//           MyCustomForm(),
//           Spacer(),
//         ],
//       ),
//     );
//   }
// }

// class ConfirmButton extends StatelessWidget {
//   const ConfirmButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8),
//       child: Align(
//         alignment: Alignment.bottomLeft,
//         child: ElevatedButton(
//           style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(Colors.red),
//             foregroundColor: MaterialStateProperty.all(Colors.white),
//           ),
//           onPressed: () {},
//           child: const Text('تأكيد'),
//         ),
//       ),
//     );
//   }
// }

// class CustomDivider extends StatelessWidget {
//   const CustomDivider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Divider(
//       endIndent: 40,
//       indent: 40,
//       thickness: 2,
//       color: Colors.red,
//     );
//   }
// }


// class Discount {
//   final String startingDate;
//   final String expiringDate;
//   final double minBillPrice;
//   final double discountPrice;

//   Discount({
//     required this.startingDate,
//     required this.expiringDate,
//     required this.minBillPrice,
//     required this.discountPrice,
//   });

//   Discount copyWith({
//     String? startingDate,
//     String? expiringDate,
//     double? minBillPrice,
//     double? discountPrice,
//   }) {
//     return Discount(
//       startingDate: startingDate ?? this.startingDate,
//       expiringDate: expiringDate ?? this.expiringDate,
//       minBillPrice: minBillPrice ?? this.minBillPrice,
//       discountPrice: discountPrice ?? this.discountPrice,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'starting_date': startingDate,
//       'expiring_date': expiringDate,
//       'min_bill_price': minBillPrice,
//       'discount_price': discountPrice,
//     };
//   }
// }

// class DiscountState {
//   final List<Discount> discounts;
//   final bool isLoading;
//   final String? errorMessage;

//   const DiscountState({
//     required this.discounts,
//     this.isLoading = false,
//     this.errorMessage,
//   });

//   DiscountState copyWith({
//     List<Discount>? discounts,
//     bool? isLoading,
//     String? errorMessage,
//   }) {
//     return DiscountState(
//       discounts: discounts ?? this.discounts,
//       isLoading: isLoading ?? this.isLoading,
//       errorMessage: errorMessage ?? this.errorMessage,
//     );
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is DiscountState &&
//         other.isLoading == isLoading &&
//         other.errorMessage == errorMessage &&
//         listEquals(other.discounts, discounts);
//   }

//   @override
//   int get hashCode =>
//       discounts.hashCode ^ isLoading.hashCode ^ errorMessage.hashCode;
// }

// class DiscountCubit extends Cubit<DiscountState> {
//   DiscountCubit() : super(const DiscountState(discounts: []));

//   void addDiscount() {
//     final newDiscount = Discount(
//       startingDate: '',
//       expiringDate: '',
//       minBillPrice: 0,
//       discountPrice: 0,
//     );
//     final updatedDiscounts = List<Discount>.from(state.discounts)
//       ..add(newDiscount);
//     emit(state.copyWith(discounts: updatedDiscounts));
//   }

//   void updateDiscount(int index, Discount updatedDiscount) {
//     final updatedDiscounts = List<Discount>.from(state.discounts)
//       ..[index] = updatedDiscount;
//     emit(state.copyWith(discounts: updatedDiscounts));
//   }

//   void removeDiscount(int index) {
//     final updatedDiscounts = List<Discount>.from(state.discounts)
//       ..removeAt(index);
//     emit(state.copyWith(discounts: updatedDiscounts));
//   }

//   Future<void> confirmDiscounts() async {
//     emit(state.copyWith(isLoading: true));
//     final accessToken = await TokenStorage().getAccessToken();
//  print(state.discounts.map((discount) => discount.toJson()).toList());
//     try {
//       final response = await Dio().post(
//         'https://backend.almowafraty.com/api/v1/add/discount',
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $accessToken',
//             'Content-Type': 'application/json',
//           },
//         ),
//         data: {
//           'discount':
//               state.discounts.map((discount) => discount.toJson()).toList(),
//         },
//       );

//       if (response.statusCode == 200) {
//         emit(state.copyWith(isLoading: false));
//         // Optionally show a success message
//       } else {
//         emit(state.copyWith(
//             isLoading: false, errorMessage: response.statusMessage));
//       }
//     } on DioException catch (e) {
//       emit(state.copyWith(isLoading: false, errorMessage: e.message));
//     } catch (e) {
//       emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
//     }
//   }
// }

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: BlocProvider(
// //         create: (context) => DiscountCubit(),
// //         child: const Logo(),
// //       ),
// //     );
// //   }
// // }

// class Logo extends StatelessWidget {
//   const Logo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => context.read<DiscountCubit>().addDiscount(),
//         backgroundColor: Colors.red,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(16.0)),
//         ),
//         child: const Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//       ),
//       backgroundColor: colorApp.BackgroundColor,
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         centerTitle: true,
//         title: const Text(
//           'LOGO',
//           style: TextStyle(color: Colors.white),
//         ),
//         leading: const Icon(
//           Icons.person_outlined,
//           color: Colors.white,
//         ),
//       ),
//       body: BlocBuilder<DiscountCubit, DiscountState>(
//         builder: (context, state) {
//           if (state.isLoading) {
//             return const Center(child: CircularProgressIndicator(
//               color: colorApp.basicColor,
//             ));
//           }
//           return SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 for (int i = 0; i < state.discounts.length; i++)
//                   LogoBody(
//                     index: i,
//                     discount: state.discounts[i],
//                     onSave: (index, discount) => context
//                         .read<DiscountCubit>()
//                         .updateDiscount(index, discount),
//                     onRemove: () =>
//                         context.read<DiscountCubit>().removeDiscount(i),
//                   ),
//                 ConfirmButton(
//                   onPressed: () =>
//                       context.read<DiscountCubit>().confirmDiscounts(),
//                 ),
//                 if (state.errorMessage != null)
//                   Text(
//                     state.errorMessage!,
//                     style: const TextStyle(color: Colors.red),
//                   ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class LogoBody extends StatelessWidget {
//   final int index;
//   final Discount discount;
//   final Function(int, Discount) onSave;
//   final VoidCallback onRemove;

//   const LogoBody({
//     super.key,
//     required this.index,
//     required this.discount,
//     required this.onSave,
//     required this.onRemove,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           IconButton(
//             icon: const Icon(Icons.delete),
//             onPressed: onRemove,
//           ),
//           RowWithText(
//             discount: discount,
//             onChanged: (updatedDiscount) => onSave(index, updatedDiscount),
//           ),
//           const SizedBox(height: 16),
//           const DateRow(),
//           const SizedBox(height: 16),
//           CustomFormRow(
//             discount: discount,
//             onChanged: (updatedDiscount) => onSave(index, updatedDiscount),
//           ),
//           const SizedBox(height: 16),
//           const CustomDivider(),
//         ],
//       ),
//     );
//   }
// }

// class RowWithText extends StatefulWidget {
//   final Discount discount;
//   final Function(Discount) onChanged;

//   const RowWithText({
//     super.key,
//     required this.discount,
//     required this.onChanged,
//   });

//   @override
//   State<RowWithText> createState() => _RowWithTextState();
// }

// class _RowWithTextState extends State<RowWithText> {
//   final TextEditingController minBillPriceController = TextEditingController();
//   final TextEditingController discountPriceController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     minBillPriceController.text = widget.discount.minBillPrice.toString();
//     discountPriceController.text = widget.discount.discountPrice.toString();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const Spacer(),
//         Container(
//           width: 100,
//           height: 40,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Colors.white,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               textDirection: TextDirection.rtl,
//               controller: discountPriceController,
//               decoration: const InputDecoration(
//                   hintText: 'قيمه الخصم',
//                   hintStyle: TextStyle(color: Colors.green)),
//               onChanged: (value) {
//                 double? discountPrice = double.tryParse(value);
//                 if (discountPrice != null) {
//                   widget.onChanged(
//                       widget.discount.copyWith(discountPrice: discountPrice));
//                 }
//               },
//             ),
//           ),
//         ),
//         const Spacer(),
//         Container(
//           width: 100,
//           height: 40,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Colors.white,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: minBillPriceController,
//               decoration: const InputDecoration(
//                   hintText: 'قيمه الفاتوره',
//                   hintStyle: TextStyle(color: Colors.red)),
//               onChanged: (value) {
//                 double? minBillPrice = double.tryParse(value);
//                 if (minBillPrice != null) {
//                   widget.onChanged(
//                       widget.discount.copyWith(minBillPrice: minBillPrice));
//                 }
//               },
//             ),
//           ),
//         ),
//         const Spacer(),
//       ],
//     );
//   }
// }

// class DateRow extends StatelessWidget {
//   const DateRow({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Row(
//       children: [
//         Spacer(),
//         Text('حتى تاريخ'),
//         Spacer(),
//         Text('بدءاً من تاريخ'),
//         Spacer(),
//       ],
//     );
//   }
// }

// class CustomFormRow extends StatelessWidget {
//   final Discount discount;
//   final Function(Discount) onChanged;

//   const CustomFormRow({
//     super.key,
//     required this.discount,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const Spacer(),
//         MyCustomForm(
//           initialDate: discount.expiringDate,
//           onChanged: (date) {
//             onChanged(discount.copyWith(expiringDate: date));
//           },
//         ),
//         const Spacer(),
//         MyCustomForm(
//           initialDate: discount.startingDate,
//           onChanged: (date) {
//             onChanged(discount.copyWith(startingDate: date));
//           },
//         ),
//         const Spacer(),
//       ],
//     );
//   }
// }

// class MyCustomForm extends StatelessWidget {
//   final String? initialDate;
//   final Function(String) onChanged;

//   const MyCustomForm({
//     super.key,
//     this.initialDate,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController controller =
//         TextEditingController(text: initialDate);
//     return Container(
//       constraints: const BoxConstraints(
//         maxWidth: 100,
//         maxHeight: 40,
//       ),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8), color: Colors.white),
//       child: TextFormField(
//         textAlign: TextAlign.center,
//         controller: controller,
//         decoration: const InputDecoration(
//             border: InputBorder.none,
//             hintText: 'أدخل التاريخ',
//             hintStyle: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 8,
//             )),
//         readOnly: true,
//         onTap: () {
//           _selectDate(context, controller);
//         },
//       ),
//     );
//   }

//   Future<void> _selectDate(
//       BuildContext context, TextEditingController controller) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null) {
//       String formattedDate =
//           '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
//       controller.text = formattedDate;
//       onChanged(formattedDate);
//     }
//   }
// }

// class ConfirmButton extends StatelessWidget {
//   final VoidCallback onPressed;

//   const ConfirmButton({super.key, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16, top: 32),
//       child: Align(
//         child: ElevatedButton(
//           style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(Colors.red),
//             foregroundColor: MaterialStateProperty.all(Colors.white),
//           ),
//           onPressed: onPressed,
//           child: const Text('تأكيد'),
//         ),
//       ),
//     );
//   }
// }

// class CustomDivider extends StatelessWidget {
//   const CustomDivider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Divider(
//       endIndent: 40,
//       indent: 40,
//       thickness: 2,
//       color: Colors.red,
//     );
//   }
// }
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:mufraty_app/Core/Config/shared_preferences.dart';

// class Discount {
//   final String startingDate;
//   final String expiringDate;
//   final double minBillPrice;
//   final double discountPrice;

//   Discount({
//     required this.startingDate,
//     required this.expiringDate,
//     required this.minBillPrice,
//     required this.discountPrice,
//   });

//   Discount copyWith({
//     String? startingDate,
//     String? expiringDate,
//     double? minBillPrice,
//     double? discountPrice,
//   }) {
//     return Discount(
//       startingDate: startingDate ?? this.startingDate,
//       expiringDate: expiringDate ?? this.expiringDate,
//       minBillPrice: minBillPrice ?? this.minBillPrice,
//       discountPrice: discountPrice ?? this.discountPrice,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'starting_date': startingDate,
//       'expiring_date': expiringDate,
//       'min_bill_price': minBillPrice,
//       'discount_price': discountPrice,
//     };
//   }
// }

// class Logo extends StatefulWidget {
//   const Logo({super.key});

//   @override
//   _LogoState createState() => _LogoState();
// }

// class _LogoState extends State<Logo> {
//   List<Discount> discounts = [];

//   void _addLogoBody() {
//     setState(() {
//       discounts.add(Discount(
//         startingDate: '',
//         expiringDate: '',
//         minBillPrice: 0,
//         discountPrice: 0,
//       ));
//     });
//   }

//   void _saveDiscountData(int index, Discount discount) {
//     setState(() {
//       discounts[index] = discount;
//     });
//   }

//   Future<void> _confirm() async {
//     print(discounts.map((discount) => discount.toJson()).toList());

//      // Replace with your actual token
// final accessToken = await TokenStorage().getAccessToken();
//     try {
//       final response = await Dio().post(
//         'https://backend.almowafraty.com/api/v1/add/discount',
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $accessToken',
//             'Content-Type': 'application/json',
//           },
//         ),
//         data: {
//           'discount': discounts.map((discount) => discount.toJson()).toList(),
//         },
//       );

//       if (response.statusCode == 200) {
//         // Handle successful response
//         print('Success: ${response.data}');
//         // Optionally show a success message to the user
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Discounts added successfully!')),
//         );
//       } else {
//         // Handle non-successful response
//         print('Error: ${response.statusMessage}');
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: ${response.statusMessage}')),
//         );
//       }
//     } on DioError catch (e) {
//       if (e.response != null) {
//         final response = e.response!;
//         if (response.data != null && response.data is Map<String, dynamic>) {
//           final Map<String, dynamic> data = response.data;
//           if (data.containsKey('message') && data.containsKey('errors')) {
//             final String message = data['message'];
//             final Map<String, dynamic> errors = data['errors'];
//             final List errorMessages = errors.values.expand((v) => v).toList();
//             final String errorMessage = errorMessages.join('\n');

//             print(' $message\n$errorMessage');
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(' $message\n$errorMessage')),
//             );
//           } else {
//             print('Dio error: ${response.statusMessage}');
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Error: ${response.statusMessage}')),
//             );
//           }
//         } else {
//           print('Dio error: ${response.statusMessage}');
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Error: ${response.statusMessage}')),
//           );
//         }
//       } else {
//         print('Error sending request: ${e.message}');
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error sending request: ${e.message}')),
//         );
//       }
//     } catch (e) {
//       print('Unexpected error: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Unexpected error: $e')),
//       );
//     }
//   }

//   void _removeDiscount(int index) {
//     setState(() {
//       discounts.removeAt(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: _addLogoBody,
//         backgroundColor: Colors.red,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(16.0)),
//         ),
//         child: const Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//       ),
//       backgroundColor: Colors.grey,
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         centerTitle: true,
//         title: const Text(
//           'LOGO',
//           style: TextStyle(color: Colors.white),
//         ),
//         leading: const Icon(
//           Icons.person_outlined,
//           color: Colors.white,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             for (int i = 0; i < discounts.length; i++)
//               LogoBody(
//                 index: i,
//                 discount: discounts[i],
//                 onSave: _saveDiscountData,
//                 onRemove: () => _removeDiscount(i),
//               ),
//             ConfirmButton(
//               onPressed: _confirm,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class LogoBody extends StatelessWidget {
//   final int index;
//   final Discount discount;
//   final Function(int, Discount) onSave;
//   final VoidCallback onRemove;

//   const LogoBody({
//     super.key,
//     required this.index,
//     required this.discount,
//     required this.onSave,
//     required this.onRemove,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           IconButton(
//             icon: const Icon(Icons.delete),
//             onPressed: onRemove, // استدعاء الدالة عند الضغط
//           ),
//           RowWithText(
//             discount: discount,
//             onChanged: (updatedDiscount) => onSave(index, updatedDiscount),
//           ),
//           const SizedBox(height: 16),
//           const DateRow(),
//           const SizedBox(height: 16),
//           CustomFormRow(
//             discount: discount,
//             onChanged: (updatedDiscount) => onSave(index, updatedDiscount),
//           ),
//           const SizedBox(height: 16),
//           const CustomDivider(),
//         ],
//       ),
//     );
//   }
// }

// class RowWithText extends StatefulWidget {
//   final Discount discount;
//   final Function(Discount) onChanged;

//   const RowWithText({
//     super.key,
//     required this.discount,
//     required this.onChanged,
//   });

//   @override
//   State<RowWithText> createState() => _RowWithTextState();
// }

// class _RowWithTextState extends State<RowWithText> {
//   final TextEditingController minBillPriceController = TextEditingController();

//   final TextEditingController discountPriceController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     // إضافة Listener لـ minBillPriceController
//     minBillPriceController.addListener(updateCursorPosition);

//     // إضافة Listener لـ discountPriceController
//     discountPriceController.addListener(updateCursorPosition);
//   }

// // دالة مساعدة لتحديث موقع المؤشر
//   void updateCursorPosition() {
//     // تحديث موقع المؤشر لـ minBillPriceController
//     final textMinBill = minBillPriceController.text;
//     minBillPriceController.value = minBillPriceController.value.copyWith(
//       text: textMinBill, // تحديث النص
//       selection: TextSelection(
//         baseOffset: textMinBill.length, // تحديث موقع المؤشر
//         extentOffset: textMinBill.length,
//       ),
//     );

//     // تحديث موقع المؤشر لـ discountPriceController
//     final textDiscount = discountPriceController.text;
//     discountPriceController.value = discountPriceController.value.copyWith(
//       text: textDiscount, // تحديث النص
//       selection: TextSelection(
//         baseOffset: textDiscount.length, // تحديث موقع المؤشر
//         extentOffset: textDiscount.length,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     // تنظيف الكونترولرات عند التخلص من الويدجت
//     minBillPriceController.dispose();
//     discountPriceController.dispose();
//     super.dispose();
//   }

//   @override
//   @override
//   Widget build(BuildContext context) {
//     minBillPriceController.text = widget.discount.minBillPrice.toString();
//     discountPriceController.text = widget.discount.discountPrice.toString();

//     return Row(
//       children: [
//         const Spacer(),
//         Container(
//           width: 100,
//           height: 40,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Colors.white,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               textDirection: TextDirection.rtl,
//               controller: discountPriceController,
//               decoration: const InputDecoration(
//                   hintText: 'قيمه الخصم',
//                   hintStyle: TextStyle(color: Colors.green)),
//               onChanged: (value) {
//                 double? discountPrice = double.tryParse(value);
//                 if (discountPrice != null) {
//                   widget.onChanged(
//                       widget.discount.copyWith(discountPrice: discountPrice));
//                 } else {
//                   // عندما يكون النص فارغًا، نضع قيمة الخصم على 0
//                   widget.onChanged(widget.discount.copyWith(discountPrice: 0));
//                 }
//               },
//             ),
//           ),
//         ),
//         const Spacer(),
//         Container(
//           width: 100,
//           height: 40,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Colors.white,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: minBillPriceController,
//               decoration: const InputDecoration(
//                   hintText: 'قيمه الفاتوره',
//                   hintStyle: TextStyle(color: Colors.red)),
//               onChanged: (value) {
//                 double? minBillPrice = double.tryParse(value);
//                 if (minBillPrice != null) {
//                   widget.onChanged(
//                       widget.discount.copyWith(minBillPrice: minBillPrice));
//                 } else {
//                   // عندما يكون النص فارغًا، نضع قيمة الخصم على 0
//                   widget.onChanged(widget.discount.copyWith(minBillPrice: 0));
//                 }
//               },
//             ),
//           ),
//         ),
//         const Spacer(),
//       ],
//     );
//   }
// }

// class DateRow extends StatelessWidget {
//   const DateRow({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Row(
//       children: [
//         Spacer(),
//         Text('حتى تاريخ'),
//         Spacer(),
//         Text('بدءاً من تاريخ'),
//         Spacer(),
//       ],
//     );
//   }
// }

// class CustomFormRow extends StatelessWidget {
//   final Discount discount;
//   final Function(Discount) onChanged;

//   const CustomFormRow({
//     super.key,
//     required this.discount,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const Spacer(),
//         MyCustomForm(
//           initialDate: discount.expiringDate,
//           onChanged: (date) {
//             onChanged(discount.copyWith(expiringDate: date));
//           },
//         ),
//         const Spacer(),
//         MyCustomForm(
//           initialDate: discount.startingDate,
//           onChanged: (date) {
//             onChanged(discount.copyWith(startingDate: date));
//           },
//         ),
//         const Spacer(),
//       ],
//     );
//   }
// }

// class MyCustomForm extends StatelessWidget {
//   final String? initialDate;
//   final Function(String) onChanged;

//   const MyCustomForm({
//     super.key,
//     this.initialDate,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController controller =
//         TextEditingController(text: initialDate);
//     return Container(
//       constraints: const BoxConstraints(
//         maxWidth: 100,
//         maxHeight: 40,
//       ),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8), color: Colors.white),
//       child: TextFormField(
//         textAlign: TextAlign.center,
//         controller: controller,
//         decoration: const InputDecoration(
//             border: InputBorder.none,
//             hintText: 'أدخل التاريخ',
//             hintStyle: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 8,
//             )),
//         readOnly: true,
//         onTap: () {
//           _selectDate(context, controller);
//         },
//       ),
//     );
//   }

//   Future<void> _selectDate(
//       BuildContext context, TextEditingController controller) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null) {
//       String formattedDate =
//           '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
//       controller.text = formattedDate;
//       onChanged(formattedDate);
//     }
//   }
// }

// class ConfirmButton extends StatelessWidget {
//   final VoidCallback onPressed;

//   const ConfirmButton({super.key, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16, top: 32),
//       child: Align(
//         child: ElevatedButton(
//           style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(Colors.red),
//             foregroundColor: MaterialStateProperty.all(Colors.white),
//           ),
//           onPressed: onPressed,
//           child: const Text('تأكيد'),
//         ),
//       ),
//     );
//   }
// }

// class CustomDivider extends StatelessWidget {
//   const CustomDivider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Divider(
//       endIndent: 40,
//       indent: 40,
//       thickness: 2,
//       color: Colors.red,
//     );
//   }
// }