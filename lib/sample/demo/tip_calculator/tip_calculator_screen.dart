import 'package:com.roy93group.flutter_tutorial/lib/util/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
 * Created by Loitp on 08,August,2022
 * Galaxy One company,
 * Vietnam
 * +840766040293
 * freuss47@gmail.com
 */
class TipCalculatorScreen extends StatelessWidget {
  double billAmount = 0.0;
  double tipPercentage = 0.0;

  @override
  Widget build(BuildContext context) {
    TextField billAmountField = TextField(
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        try {
          billAmount = double.parse(value);
        } catch (exception) {
          billAmount = 0.0;
        }
      },
      decoration: InputDecoration(
        labelText: "Bill amount(\$)",
      ),
    );

    // Create another input field
    TextField tipPercentageField = TextField(
        decoration: InputDecoration(
          labelText: "Tip %",
          hintText: "15",
        ),
        keyboardType: TextInputType.number,
        onChanged: (String value) {
          try {
            tipPercentage = double.parse(value);
          } catch (exception) {
            tipPercentage = 0.0;
          }
        });

    Container container = Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        billAmountField,
        tipPercentageField,
        UIUtils.getButton(
          "Calculate",
          () {
            // Calculate tip and total
            double calculatedTip = billAmount * tipPercentage / 100.0;
            double total = billAmount + calculatedTip;

            // Generate dialog
            AlertDialog dialog = AlertDialog(
                content: Text("Tip: \$$calculatedTip \n"
                    "Total: \$$total"));

            // Show dialog
            showDialog(
                context: context, builder: (BuildContext context) => dialog);
          },
        ),
      ]),
    );

    AppBar appBar = UIUtils.getAppBar(
      "Tip Calculator",
      () => Get.back(),
      null,
    );

    Scaffold scaffold = Scaffold(
      appBar: appBar,
      body: container,
    );
    return scaffold;
  }
}
