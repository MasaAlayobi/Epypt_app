import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mufraty_app/Core/Config/shared_preferences.dart';
import 'package:mufraty_app/Core/Config/widget/custom_listTile.dart';
import 'package:mufraty_app/Core/Config/widget/custom_text.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Home/Discounts/view/Discounts_page.dart';

//
class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  String startDate = '';
  String endDate = '';

  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startDateController.addListener(_onStartDateChanged);
    _endDateController.addListener(_onEndDateChanged);
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  void _onStartDateChanged() {
    startDate = _startDateController.text;
    _getReportData();
  }

  void _onEndDateChanged() {
    endDate = _endDateController.text;
    _getReportData();
  }

  void _getReportData() {
    if (startDate.isNotEmpty && endDate.isNotEmpty) {
      //  BlocProvider.of<ReportCubit>(context).getReport(startDate, endDate);
      context.read<ReportCubit>().getReport(startDate, endDate);
    }
    print('تاريخ البداية: $startDate');
    print('تاريخ النهاية: $endDate');
  }

  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.of(context).size.height;

    double widthSize = MediaQuery.of(context).size.width;
    return Builder(builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: colorApp.BackgroundColor,
          appBar: AppBar(
            backgroundColor: colorApp.basicColor,
            actions: const [
              Icon(
                Icons.person_outline,
                size: 33,
                color: colorApp.blackColor,
              )
            ],
            title: CustomText(
                text: 'تقاريري',
                size: 18,
                color: colorApp.blackColor,
                fontWeight: FontWeight.w800,
                maxLines: 1),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              text: 'من',
                              size: 15,
                              color: colorApp.blackColor,
                              fontWeight: FontWeight.w500,
                              maxLines: 1),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                      color: colorApp.greyColor, width: 1)),
                              child: MyCustomForm(
                                controller: _startDateController,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: _getReportData,
                  //   child: const Text('جلب التقرير'),
                  // ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              text: 'إلى',
                              size: 15,
                              color: colorApp.blackColor,
                              fontWeight: FontWeight.w500,
                              maxLines: 1),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                    color: colorApp.greyColor, width: 1),
                              ),
                              child: MyCustomForm(
                                controller: _endDateController,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<ReportCubit, ReportState>(
                    builder: (context, state) {
                      if (state is ReportLoaded) {
                        return ListView(
                          children: [
                            CustomListTile(
                                icon: Icons.library_books,
                                iconColor: colorApp.blueColor,
                                title: 'عدد الفواتير المدفوعة',
                                subtitle: '${state.report.paidBill}'),
                            CustomListTile(
                                icon: Icons.mark_unread_chat_alt,
                                iconColor: colorApp.greenColor,
                                title: 'عدد الفواتير المستلمة',
                                subtitle: '${state.report.receivedBill}'),
                            CustomListTile(
                                icon: Icons.groups,
                                iconColor: colorApp.yellowColor,
                                title: 'عدد العملاء',
                                subtitle: '${state.report.marketsCount}'),
                            CustomListTile(
                                icon: Icons.payments,
                                iconColor: colorApp.greenColor,
                                title: 'منوسط قيمة الفاتورة',
                                subtitle: '${state.report.averageBills}'),
                            CustomListTile(
                                icon: Icons.event_available,
                                iconColor: colorApp.blueColor,
                                title: 'إجمالي المبيعات المحققة',
                                subtitle: '${state.report.totalPrice}'),
                            CustomListTile(
                                icon: Icons.event_busy,
                                iconColor: colorApp.basicColor,
                                title: 'قيمة المبيعات المهدرة',
                                subtitle: '${state.report.wastedBill}'),
                          ],
                        );
                      } else if (state is ReportLoading) {
                        return const Center(
                            child: CircularProgressIndicator());
                      } else if (state is ReportError) {
                        return RefreshIndicator(
                          onRefresh: () async {
                            context
                                .read<ReportCubit>()
                                .getReport(startDate, endDate);
                          },
                          child: ListView(
                            children: [
                              Center(
                                child: Image.asset(
                                  "asstes/images/internet.png",
                                  width: widthSize / 2,
                                  height: heightSize / 2,
                                ),
                              ),
                              Center(
                                  child: Text(
                                state.message ==
                                        'Null check operator used on a null value'
                                    ? "لقد انقطع الاتصال بالانترنت"
                                    : state.message,
                                style: TextStyle(
                                    color: ColorManager().red,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700),
                              ))
                            ],
                          ),
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.icon,
      required this.iconColor,
      required this.title,
      required this.subtitle});
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Icon(
          icon,
          size: 27,
          color: iconColor,
        ),
        title: CustomText(
            text: title,
            size: 12,
            color: colorApp.greyColor,
            fontWeight: FontWeight.bold,
            maxLines: 1),
        subtitle: CustomText(
            text: subtitle,
            size: 14,
            color: colorApp.blackColor,
            fontWeight: FontWeight.w700,
            maxLines: 1),
      ),
    );
  }
}

// class colorApp {
//   static const Color basicColor = Color(0xffE32020);
//   static const Color blackColor = Colors.black;
//   static const Color whiteColor = Colors.white;
//   static const Color greyColor = Color.fromARGB(255, 138, 138, 138);
//   static const Color greyLightColor = Color.fromARGB(255, 201, 195, 195);
//   static const Color greenColor = Colors.green;
//   static const Color blueColor = Colors.blue;
//   static const Color yellowColor = Color.fromARGB(255, 252, 227, 3);
//   static const Color BackgroundColor = Color.fromARGB(136, 224, 214, 214);
// }

// class CustomText extends StatelessWidget {
//   const CustomText(
//       {super.key,
//       required this.text,
//       required this.size,
//       required this.color,
//       required this.fontWeight,
//       required this.maxLines});
//   final String text;
//   final double size;
//   final Color color;
//   final FontWeight fontWeight;
//   final int maxLines;

//   @override
//   Widget build(BuildContext context) {
//     return Text(text,
//         style: TextStyle(fontSize: size, fontWeight: fontWeight, color: color),
//         maxLines: maxLines,
//         overflow: TextOverflow.ellipsis);
//   }
// }

class MyCustomForm extends StatefulWidget {
  final TextEditingController controller;

  const MyCustomForm({
    super.key,
    required this.controller,
  });

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        String formattedDate =
            '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
        widget.controller.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 200,
        maxHeight: 50,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        style: TextStyle(fontSize: 13),
        textAlign: TextAlign.center,
        controller: widget.controller,
        decoration: InputDecoration(
          // labelText: 'ادخل التاريخ',
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          hintText: 'أدخل التاريخ',
          hintStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.blueGrey,
          ),
          contentPadding: const EdgeInsets.only(bottom: 10),
          prefixIcon: const Icon(Icons.calendar_today, color: Colors.red),
        ),
        readOnly: true,
        onTap: () => _selectDate(context),
      ),
    );
  }
}

abstract class ReportState {}

class ReportInitial extends ReportState {}

class ReportLoading extends ReportState {}

class ReportLoaded extends ReportState {
  final Report report;

  ReportLoaded(this.report);
}

class ReportError extends ReportState {
  final String message;

  ReportError(this.message);
}

class ReportCubit extends Cubit<ReportState> {
  Dio dio = Dio();
  String? token;

  ReportCubit({this.token}) : super(ReportInitial());

  Future<void> getReport(String startDate, String endDate) async {
    final accessToken = await TokenStorage().getAccessToken();
    print(accessToken);
    emit(ReportLoading());
    try {
      dio!.options.headers['Authorization'] = 'Bearer $accessToken';
      final response = await dio!.get(
        'https://backend.almowafraty.com/api/v1/reports',
        queryParameters: {
          'start_date': startDate,
          'end_date': endDate,
        },
      );
      print(response.data);
      final report = Report.fromJson(response.data['body']);
      emit(ReportLoaded(report));
    } on DioException catch (e) {
      emit(ReportError(e.response.toString()));
    }
  }
}

class Report {
  final int? paidBill;
  final int? marketsCount;
  final int? averageBills;
  final int? totalPrice;
  final int? wastedBill;
  final int? receivedBill;

  Report({
    required this.paidBill,
    required this.marketsCount,
    required this.averageBills,
    required this.totalPrice,
    required this.wastedBill,
    required this.receivedBill,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      paidBill: json['paid_Bill'],
      marketsCount: json['markets_Count'],
      averageBills: json['average_Bills'],
      totalPrice: json['total_Price'],
      wastedBill: json['wasted_Bill'],
      receivedBill: json['received_Bill'],
    );
  }
}
