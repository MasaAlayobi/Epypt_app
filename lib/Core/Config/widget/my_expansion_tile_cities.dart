// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mufraty_app/Core/Config/widget/Titles.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Auth/login/view/login_view.dart';
import 'package:mufraty_app/feature/Auth/register/bloc/register_bloc.dart';
import 'package:mufraty_app/feature/Auth/register/view/register_page.dart';

class MyExpansionTileCities extends StatefulWidget {
  String text1;
  // String text2;
  // String text3;
  bool? variable;
  final Function(List<num>) onDataChanged;
  Widget widget;
  MyExpansionTileCities({
    Key? key,
    required this.text1,
    // required this.text2,
    // required this.text3,
    this.variable,
    required this.widget, required this.onDataChanged,
  }) : super(key: key);

  @override
  State<MyExpansionTileCities> createState() => _myExpansionTileState();
}

class _myExpansionTileState extends State<MyExpansionTileCities> {
  List<num> citiesId = [];
  String? selectedTitle;
  ExpansionTileController controller = ExpansionTileController();
 void someFunctionThatChangesData(List<num> citiesId ) {
    
      
    widget.onDataChanged(citiesId);
  }
  @override
  void initState() {
    super.initState();
    selectedTitle = widget.text1; // تعيين القيمة الابتدائية للعنوان
  }

  @override
  Widget build(BuildContext context) {
    bool isCheckedCheckBox2 = false;
    return BlocProvider(
      create: (context) => RegisterBloc()..add(getCities()),
      child: ExpansionTile(
        onExpansionChanged: (value) {
          if (value == false) {
            someFunctionThatChangesData(citiesId);
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //       builder: (_) => SignUp(
            //         cititesId: citiesId,
            //       ),
            //     ));
             
          }
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
              if (state is successFetchCities) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: state.Cities.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, ind) => ExpansionTile(
                    onExpansionChanged: (value) {
                      if (state.Cities[ind].childrens.isEmpty) {
                        citiesId.add(state.Cities[ind].id);
                        print(citiesId);}
                    },
                    // controller: controller,
                    title: HeaderText(
                        text: state.Cities[ind].name,
                        fontSize: 16,
                        textcolor: ColorManager().grey1,
                        fontWeight: FontWeight.w600),
                    backgroundColor: Colors.grey[200],
                    collapsedShape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    collapsedBackgroundColor: Colors.grey[200],
                    textColor: ColorManager().red,
                    iconColor: ColorManager().red,
                    children: [
                      ListView.separated(
                        itemCount: state.Cities[ind].childrens.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            // citiesId
                            //     .add(state.Cities[ind].childrens[index].id);
                            // print(citiesId);
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => SignUp(
                            //       // cityId: ind,
                            //       cititesId: citiesId,
                            //     ),
                            //   ),
                            // );
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
                                      text: state
                                          .Cities[ind].childrens[index].name,
                                      fontSize: 16,
                                      textcolor: ColorManager().grey1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                StatefulBuilder(
                                  builder: (context, setState) => Checkbox(
                                    
                                    activeColor: ColorManager().red,
                                    value: isCheckedCheckBox2,
                                    onChanged: (bool? value) {
                                      citiesId.add(state.Cities[ind].childrens[index].id);
                            print(citiesId);
                                      setState(() {
                                        isCheckedCheckBox2 = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) => Divider(
                          indent: 22,
                          endIndent: 22,
                        ),
                      ),
                    ],
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
