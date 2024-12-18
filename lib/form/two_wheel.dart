import 'package:flutter/material.dart';
import 'package:janta_bike/form/field.dart';
import 'package:janta_bike/ui/color.dart';

class TwoWheel extends StatefulWidget {
  const TwoWheel({super.key});

  @override
  State<TwoWheel> createState() => _TwoWheelState();
}

class _TwoWheelState extends State<TwoWheel> {
  final TextEditingController brand = TextEditingController();
  final TextEditingController Year = TextEditingController();
  final TextEditingController Fuel = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text('Two Wheel',style: TextStyle(color: AppColor.white,fontSize: 20,
        fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(controller: brand,
              hintText: "Brand*",
                borderRadius: 15,

              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(controller: Year,
              hintText: "Year*",
                borderRadius: 15,
              ),
            ),
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(controller: Fuel,
              hintText: 'Fuel*',
                borderRadius: 15,
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          foregroundColor: AppColor.white
                        ),
                        child: Text('Next',style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 20,
                    ),)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
