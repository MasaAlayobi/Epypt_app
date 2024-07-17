// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mufraty_app/Core/Config/widget/Titles.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Auth/login/view/login_view.dart';
import 'package:mufraty_app/feature/Auth/register/bloc/register_bloc.dart';
import 'package:mufraty_app/feature/Auth/register/view/register_page.dart';


class myExpansionTile extends StatefulWidget {
  String text1;
  // String text2;
  // String text3;
  // bool? variable=true;
  final Function(num) onDataChanged;
  Widget widget;
  myExpansionTile({
    Key? key,
    required this.text1,
    // required this.text2,
    // required this.text3,
    // this.variable,
    required this.widget,
    required this.onDataChanged,
  }) : super(key: key);

  @override
  State<myExpansionTile> createState() => _myExpansionTileState();
}

class _myExpansionTileState extends State<myExpansionTile> {
  List citiesId = [];
  String? selectedTitle;
  ExpansionTileController controller = ExpansionTileController();

  @override
  void initState() {
    super.initState();
    selectedTitle = widget.text1; // تعيين القيمة الابتدائية للعنوان
  }
  // num? citieId;
  void someFunctionThatChangesData(num citieId) {
    widget.onDataChanged(citieId);
  }
bool _isExpanded = false;
 void _handleTap() {
    setState(() {
      _isExpanded = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => RegisterBloc()..add(getCities())
      // ..add(getCities())
      ,
      child: ExpansionTile(
        initiallyExpanded: _isExpanded,
        onExpansionChanged: (value) {
          setState(() {
            _isExpanded=value;
            // variable=_isExpanded;
          });
          print(_isExpanded);
          //   if(variable == false){
          // //   context.read<RegisterBloc>().add(getCities());
          // // controller.collapse();
          //   }
          // print(variable);
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
                  itemBuilder: (context, ind) => InkWell(
                    onTap: () {
                      // setState(() {
                        //  selectedTitle=state.Cities[ind].name;
                        if (state.Cities[ind].childrens.isEmpty) {
                         someFunctionThatChangesData(state.Cities[ind].id);
                         _handleTap();
                          setState(() {
                        //  variabl==false;
                         
                              // تحديث الحالة بالقيمة الجديدة
                              selectedTitle = state.Cities[ind].name;
                            });
                         
                        }
                        print('dddddddddddddddddddddddddddddddddddddddddddd');
                      // });
                    },
                    child: ExpansionTile(
                      // controller: controller,
                      initiallyExpanded: _isExpanded,
        onExpansionChanged: (val) {
          setState(() {
            // variable=_isExpanded;
            _isExpanded=val;
          });
          print(_isExpanded);
          return ExpansionTileController.of(
                                                      context)
                                                  .collapse();
          //   if(variable == false){
          // //   context.read<RegisterBloc>().add(getCities());
          // // controller.collapse();
          //   }
          // print(variable);
        },
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
                             someFunctionThatChangesData(state.Cities[ind].childrens[index].id);
                             _handleTap();
                              setState(() {
                            //  variabl==false;
                             print(_isExpanded);
                              // تحديث الحالة بالقيمة الجديدة
                              selectedTitle = state.Cities[ind].childrens[index].name;

                            });
                             return ExpansionTileController.of(
                                                      context)
                                                  .collapse();
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
                                  widget.widget
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
