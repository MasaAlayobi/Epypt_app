import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Config/shared_preferences.dart';

class Discount {
  final String startingDate;
  final String expiringDate;
  final num minBillPrice;
  final num discountPrice;

  Discount({
    required this.startingDate,
    required this.expiringDate,
    required this.minBillPrice,
    required this.discountPrice,
  });

  Discount copyWith({
    String? startingDate,
    String? expiringDate,
    num? minBillPrice,
    num? discountPrice,
  }) {
    return Discount(
      startingDate: startingDate ?? this.startingDate,
      expiringDate: expiringDate ?? this.expiringDate,
      minBillPrice: minBillPrice ?? this.minBillPrice,
      discountPrice: discountPrice ?? this.discountPrice,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'starting_date': startingDate,
      'expiring_date': expiringDate,
      'min_bill_price': minBillPrice,
      'discount_price': discountPrice,
    };
  }
}

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  List<Discount> discounts = [];
  void _addLogoBody() {
    setState(() {
      discounts.add(Discount(
        startingDate: '',
        expiringDate: '',
        minBillPrice: 0,
        discountPrice: 0,
      ));
    });
  }

  void _saveDiscountData(int index, Discount discount) {
    setState(() {
      discounts[index] = discount;
    });
  }

  Future<void> _confirm() async {
    print(discounts.map((discount) => discount.toJson()).toList());

    final accessToken = await TokenStorage().getAccessToken();

    try {
      final response = await Dio().post(
        'https://backend.almowafraty.com/api/v1/add/discount',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'discount': discounts.map((discount) => discount.toJson()).toList(),
        },
      );

      if (response.statusCode == 200) {
        print('Success: ${response.data}');
        // Optionally show a success message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.red,
              content: Text('تم إضافة الخصم بنجاح')),
        );
      } else {
        print('{response.data}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.red,
              content: Text('{response.statusMessage}')),
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final response = e.response!.data["message"];
        if (response.data != null && response.data is Map<String, dynamic>) {
          final Map<String, dynamic> data = response.data;
          if (data.containsKey('message') && data.containsKey('errors')) {
            final String message = data['message'];
            final Map<String, dynamic> errors = data['errors'];
            final List errorMessages = errors.values.expand((v) => v).toList();
            final String errorMessage = errorMessages.join('\n');
            print(' $message\n$errorMessage');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: const Color(0xffE32020),
                  content: Text(' $message\n$errorMessage')),
            );
          } else {
            print('{response.statusMessage}');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: const Color(0xffE32020),
                  content: Text('{response.statusMessage}')),
            );
          }
        } else {
          print(' ${response.statusMessage}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: const Color(0xffE32020),
                content: Text(
                  ' ${response.statusMessage}',
                )),
          );
        }
      } else {
        print(' ${e.message}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: const Color(0xffE32020),
              content: Text(' ${e.message}')),
        );
      }
    } catch (e) {
      print(' $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: const Color(0xffE32020),
            content: Text(' $e')),
      );
    }
  }

  void _removeDiscount(int index) {
    setState(() {
      discounts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _addLogoBody,
          backgroundColor: const Color(0xffE32020),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xffE8E2E2),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              for (int i = 0; i < discounts.length; i++)
                LogoBody(
                  index: i,
                  discount: discounts[i],
                  onSave: _saveDiscountData,
                  onRemove: () => _removeDiscount(i),
                ),
              ConfirmButton(
                onPressed: _confirm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LogoBody extends StatelessWidget {
  final int index;
  final Discount discount;
  final Function(int, Discount) onSave;
  final VoidCallback onRemove;

  const LogoBody({
    super.key,
    required this.index,
    required this.discount,
    required this.onSave,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onRemove, // استدعاء الدالة عند الضغط
          ),
          const Row(
            children: [
              Spacer(),
              Text(
                'قيمة الخصم',
                style: TextStyle(
                    color: Color.fromARGB(255, 65, 139, 68),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Spacer(),
              Text(
                'قيمة الفاتورة',
                style: TextStyle(
                    color: Color(0xffE32020),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Spacer(),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          RowWithText(
            discount: discount,
            onChanged: (updatedDiscount) => onSave(index, updatedDiscount),
          ),
          const SizedBox(height: 16),
          const DateRow(),
          const SizedBox(height: 8),
          CustomFormRow(
            discount: discount,
            onChanged: (updatedDiscount) => onSave(index, updatedDiscount),
          ),
          const SizedBox(height: 16),
          const CustomDivider(),
        ],
      ),
    );
  }
}

class RowWithText extends StatefulWidget {
  final Discount discount;
  final Function(Discount) onChanged;

  const RowWithText({
    super.key,
    required this.discount,
    required this.onChanged,
  });

  @override
  State<RowWithText> createState() => _RowWithTextState();
}

class _RowWithTextState extends State<RowWithText> {
  final TextEditingController minBillPriceController = TextEditingController();

  final TextEditingController discountPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // إضافة Listener لـ minBillPriceController
    minBillPriceController.addListener(updateCursorPosition);

    // إضافة Listener لـ discountPriceController
    discountPriceController.addListener(updateCursorPosition);
  }

// دالة مساعدة لتحديث موقع المؤشر
  void updateCursorPosition() {
    // تحديث موقع المؤشر لـ minBillPriceController
    final textMinBill = minBillPriceController.text;
    minBillPriceController.value = minBillPriceController.value.copyWith(
      text: textMinBill, // تحديث النص
      selection: TextSelection(
        baseOffset: textMinBill.length, // تحديث موقع المؤشر
        extentOffset: textMinBill.length,
      ),
    );

    // تحديث موقع المؤشر لـ discountPriceController
    final textDiscount = discountPriceController.text;
    discountPriceController.value = discountPriceController.value.copyWith(
      text: textDiscount, // تحديث النص
      selection: TextSelection(
        baseOffset: textDiscount.length, // تحديث موقع المؤشر
        extentOffset: textDiscount.length,
      ),
    );
  }

  @override
  void dispose() {
    // تنظيف الكونترولرات عند التخلص من الويدجت
    minBillPriceController.dispose();
    discountPriceController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    minBillPriceController.text = widget.discount.minBillPrice.toString();
    discountPriceController.text = widget.discount.discountPrice.toString();

    return Row(
      children: [
        const Spacer(),
        Container(
          width: 100,
          height: 46.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Center(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              //textDirection: TextDirection.rtl,
              controller: discountPriceController,
              decoration: const InputDecoration(
                  hintText: 'قيمه الخصم',
                  hintStyle: TextStyle(color: Colors.green)),
              onChanged: (value) {
                num? discountPrice = num.tryParse(value);
                if (discountPrice != null) {
                  widget.onChanged(
                      widget.discount.copyWith(discountPrice: discountPrice));
                } else {
                  // عندما يكون النص فارغًا، نضع قيمة الخصم على 0
                  widget.onChanged(widget.discount.copyWith(discountPrice: 0));
                }
              },
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 100,
          height: 46.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Center(
            child: TextFormField(
              //textDirection: TextDirection.ltr,
              keyboardType: TextInputType.number,
              controller: minBillPriceController,
              decoration: const InputDecoration(
                  hintText: 'قيمه الفاتوره',
                  hintStyle: TextStyle(color: Color(0xffE32020))),
              onChanged: (value) {
                num? minBillPrice = num.tryParse(value);
                if (minBillPrice != null) {
                  widget.onChanged(
                      widget.discount.copyWith(minBillPrice: minBillPrice));
                } else {
                  // عندما يكون النص فارغًا، نضع قيمة الخصم على 0
                  widget.onChanged(widget.discount.copyWith(minBillPrice: 0));
                }
              },
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

class DateRow extends StatelessWidget {
  const DateRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(),
        Text(
          'حتى تاريخ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text(
          'بدءاً من تاريخ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Spacer(),
      ],
    );
  }
}

class CustomFormRow extends StatelessWidget {
  final Discount discount;
  final Function(Discount) onChanged;

  const CustomFormRow({
    super.key,
    required this.discount,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        MyCustomForm(
          initialDate: discount.expiringDate,
          onChanged: (date) {
            onChanged(discount.copyWith(expiringDate: date));
          },
        ),
        const Spacer(),
        MyCustomForm(
          initialDate: discount.startingDate,
          onChanged: (date) {
            onChanged(discount.copyWith(startingDate: date));
          },
        ),
        const Spacer(),
      ],
    );
  }
}

class MyCustomForm extends StatelessWidget {
  final String? initialDate;
  final Function(String) onChanged;

  const MyCustomForm({
    super.key,
    this.initialDate,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        TextEditingController(text: initialDate);
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 100,
        maxHeight: 40,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        textAlign: TextAlign.center,
        controller: controller,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'أدخل التاريخ',
            hintStyle: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Color(0xffE32020))),
        readOnly: true,
        onTap: () {
          _selectDate(context, controller);
        },
      ),
    );
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      String formattedDate =
          '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      controller.text = formattedDate;

      onChanged(formattedDate);
    }
  }
}

class ConfirmButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ConfirmButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 32),
      child: Align(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xffE32020)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: onPressed,
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
        endIndent: 40, indent: 40, thickness: 2, color: Color(0xffE32020));
  }
}
