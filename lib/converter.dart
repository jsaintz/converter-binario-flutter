import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConverterLayout extends StatefulWidget {
  @override
  ConverterLayoutState createState() {
    return new ConverterLayoutState();
  }
}

class ConverterLayoutState extends State<ConverterLayout> {
  final insets = EdgeInsets.symmetric(horizontal: 0.0, vertical: 6.0);

  final bin = TextEditingController();
  final dec = TextEditingController();

  @override
  void dispose() {
    dec.dispose();
    bin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _lvList = <Widget>[
      SizedBox(height: 25.0),

      // Decimal input
      TextField(
        cursorRadius: Radius.circular(2.0),
        keyboardType: TextInputType.number,
        controller: dec,
        onChanged: (status) => converter(0, status),
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          labelText: "Decimal",
          contentPadding: insets,
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(19),
          WhitelistingTextInputFormatter(RegExp("[0-9]"))
        ],
      ),

      SizedBox(height: 24.0),

      // Binario input
      TextField(
        cursorRadius: Radius.circular(2.0),
        keyboardType: TextInputType.number,
        controller: bin,
        onChanged: (status) => converter(2, status),
        cursorColor: Theme.of(context).primaryColor,
        maxLines: 3,
        inputFormatters: [
          LengthLimitingTextInputFormatter(63),
          WhitelistingTextInputFormatter(RegExp("[01]"))
        ],
        decoration: InputDecoration(
          labelText: "Binario",
          contentPadding: insets,
        ),
      ),
    ];
    return Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: _lvList,
      ),
    );
  }

  void converter(int alteracao, String val) {
    if (val == "") {
      dec.text = "";
      bin.text = "";
      return;
    }

    int convN;
    switch (alteracao) {
      case 0:
        convN = int.tryParse(val);
        if (convN == null) {
          convN = 9223372036854775807;
          dec.text = convN.toString();
        }

        bin.text = convN.toRadixString(2);
        break;
      case 1:
        convN = int.tryParse(val, radix: 16);
        if (convN == null) {
          convN = 9223372036854775807;
        }
        dec.text = convN.toString();
        bin.text = convN.toRadixString(2);
        break;
      case 2:
        convN = int.tryParse(val, radix: 2);
        dec.text = convN.toString();
        break;
      default:
        debugPrint("Verificar!");
        break;
    }
  }
}
