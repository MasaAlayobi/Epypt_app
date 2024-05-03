// import 'package:easy_localization/easy_localization.dart';

// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// class DiscountsPage extends StatelessWidget {
//   const DiscountsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Logo());
//   }
// }

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final TextEditingController _controller = TextEditingController();

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
        _controller.text = formattedDate;

        //  _controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 100,
          maxHeight: 50,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: TextFormField(
          textAlign: TextAlign.center,
          controller: _controller,
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'أدخل التاريخ',
              hintFadeDuration: Duration(),
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              )),
          readOnly: true,
          onTap: () {
            _selectDate(context);
          },
        ),
      ),
    );
  }
}

class DiscountsPage extends StatefulWidget {
  const DiscountsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<DiscountsPage> {
  List<Widget> logoWidgets = [];

  void _addLogoBody() {
    setState(() {
      logoWidgets.add(const LogoBody());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _addLogoBody,
          backgroundColor: Colors.red,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        backgroundColor:  Color.fromARGB(136, 224, 214, 214),
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text(
            'LOGO',
            style: TextStyle(color: Colors.white),
          ),
          leading: const Icon(
            Icons.person_outlined,
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ...logoWidgets,
            ],
          ),
        ),
      ),
    );
  }
}

class LogoBody extends StatelessWidget {
  const LogoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            RowWithText(),
            SizedBox(height: 16),
            DateRow(),
            SizedBox(height: 16),
            CustomFormRow(),
            SizedBox(height: 16),
            ConfirmButton(),
            SizedBox(height: 16),
            CustomDivider(),
          ],
        ),
      ),
    );
  }
}

class RowWithText extends StatelessWidget {
  const RowWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('قيمة الفاتورة'),
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('قيمة الخصم'),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class DateRow extends StatelessWidget {
  const DateRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: const Row(
        children: [
          Spacer(),
          Text('بدءاً من تاريخ'),
          Spacer(),
          Text('حتى تاريخ'),
          Spacer(),
        ],
      ),
    );
  }
}

class CustomFormRow extends StatelessWidget {
  const CustomFormRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: const Row(
        children: [
          Spacer(),
          MyCustomForm(),
          Spacer(),
          MyCustomForm(),
          Spacer(),
        ],
      ),
    );
  }
}

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: () {},
          child: const Text('تأكيد'),
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      endIndent: 40,
      indent: 40,
      thickness: 2,
      color: Colors.red,
    );
  }
}
