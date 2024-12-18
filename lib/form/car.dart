import 'package:flutter/material.dart';
import 'package:janta_bike/form/field.dart';
import 'package:janta_bike/ui/color.dart';

class CarForm extends StatefulWidget {
  const CarForm({super.key});

  @override
  State<CarForm> createState() => _CarFormState();
}

class _CarFormState extends State<CarForm> {
  final TextEditingController brand= TextEditingController();
  final TextEditingController year = TextEditingController();
  final TextEditingController Fuel = TextEditingController();
  final TextEditingController KM  = TextEditingController();
  final TextEditingController no_of_owner= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
      
          title: Text('Car Form',style: TextStyle(color: AppColor.white,fontSize: 25,fontWeight: FontWeight.bold),),
          backgroundColor: AppColor.primary,
      
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                 child: CustomTextField(controller: brand,
                   hintText: 'Your brand',
                   borderColor: AppColor.primary,
                   borderRadius: 15,
                 ),


                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(controller: year,
                  hintText: 'Year*',
                  borderColor: AppColor.primary,
                  borderRadius: 15,),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(controller: Fuel,
                    hintText: 'Fuel*',
                    borderColor: AppColor.primary,
                    borderRadius: 15,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primary,
                            foregroundColor: AppColor.white
                          ),
                          child: Text('Automatic'),
                        ),
                      ),
                      SizedBox(width: 8.0), // Add spacing between the buttons
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primary,
                            foregroundColor: AppColor.white
                          ),
                          child: Text('Manual'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(controller: KM,
                    hintText: 'KM Driven',
                    borderColor: AppColor.primary,
                    borderRadius: 15,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(controller: no_of_owner,
                    hintText: 'No. of Owners',
                    borderColor: AppColor.primary,
                    borderRadius: 15,),
                ),

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   children: [
                     Expanded(
                       child: ElevatedButton(onPressed: (){},
                           style: ElevatedButton.styleFrom(
                             backgroundColor: AppColor.primary,
                             foregroundColor: AppColor.white
                           ),

                           child: Text('Next',style: TextStyle(fontWeight: FontWeight.bold,
                         fontSize: 25
                        ),)),
                     ),
                   ],
                 ),
               )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
