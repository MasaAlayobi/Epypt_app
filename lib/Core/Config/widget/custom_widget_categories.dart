import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mufraty_app/Core/Config/widget/Titles.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Auth/register/bloc/register_bloc.dart';

class CustomWidgetCategories extends StatefulWidget {
  String text1;
  // String text2;
  // String text3;
  bool? variable;
  final Function(num) onDataChanged;
  Widget widget;
  CustomWidgetCategories({
    Key? key,
    required this.text1,
    // required this.text2,
    // required this.text3,
    this.variable,
    required this.widget,
    required this.onDataChanged,
  }) : super(key: key);

  @override
  State<CustomWidgetCategories> createState() => _CustomWidgetCategoriesState();
}

class _CustomWidgetCategoriesState extends State<CustomWidgetCategories> {
  // List citiesId = [];
  String? selectedTitle;
  ExpansionTileController controller = ExpansionTileController();

  @override
  void initState() {
    super.initState();
    selectedTitle = widget.text1; // تعيين القيمة الابتدائية للعنوان
  }
  // num? citieId;
  void someFunctionThatChangesData(num categoryId) {
    print(categoryId);
    widget.onDataChanged(categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc()..add(getCategoriesSuppler()),
      child: ExpansionTile(
        onExpansionChanged: (value) {
          print(value);
        },
        title: Text(
          selectedTitle!,
          style: TextStyle(
              color: ColorManager().grey1,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.grey[200],
        collapsedShape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        collapsedBackgroundColor: Colors.grey[200],
        textColor: ColorManager().red,
        iconColor: ColorManager().red,
        children: [
          BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              if (state is successFetchCategories) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: state.Suppler.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, ind) =>InkWell(
                            onTap: () {
                             someFunctionThatChangesData(state.Suppler[ind].id);
                            //  print(widget.onDataChanged.toString());
                              setState(() {
                              // تحديث الحالة بالقيمة الجديدة
                              selectedTitle = state.Suppler[ind].type;
                            });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 33, vertical: 11),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: HeaderText(
                                        text: state.Suppler[ind].type,
                                        fontSize: 16,
                                        textcolor: ColorManager().grey1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  widget.widget
                                ],
                              ),
                            ),
                          ),
                  separatorBuilder: (context, index) => Divider(
                            indent: 22,
                            endIndent: 22,
                          ),
                );
              } else if (state is loading) {
                return Center(
                    child: CircularProgressIndicator(
                  // strokeAlign: 0.1,
                  color: colorApp.basicColor,
                  strokeWidth: 3,
                  // strokeCap: ,
                ));
              } else if (state is NotFound) {
                return Center(
                  child: Text('لا يوجد مدن لعرضها '),
                );
              } else {
                return Center(
                  child: Text('خطأ في الاتصال '),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
//  ListView.separated(
//                           itemCount: state.Suppler.length,
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemBuilder: (context, index) => InkWell(
//                             onTap: () {
//                              someFunctionThatChangesData(state.Cities[ind].childrens[index].id);
//                             },
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 33, vertical: 11),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Expanded(
//                                     child: Container(
//                                       child: HeaderText(
//                                         text: state
//                                             .Cities[ind].childrens[index].name,
//                                         fontSize: 16,
//                                         textcolor: ColorManager().grey1,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                   ),
//                                   widget.widget
//                                 ],
//                               ),
//                             ),
//                           ),
//                           separatorBuilder: (context, index) => Divider(
//                             indent: 22,
//                             endIndent: 22,
//                           ),
//                         ),