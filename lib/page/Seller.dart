import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../form/car.dart';
import '../form/two_wheel.dart';
import '../ui/color.dart';

class Selling extends StatefulWidget {
  const Selling({super.key});

  @override
  State<Selling> createState() => _SellingState();
}

class _SellingState extends State<Selling> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primary,
          title: Text('Seller Page',style: TextStyle(color: AppColor.white,fontWeight: FontWeight.bold,
              fontSize: 28),),
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute
                  (builder: (context)=>TwoWheel()));
              },
              child: Card(
                elevation: 5,
                child: Row(
                  children: [
                    SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/logo/motorcycle.png')),
                    SizedBox(width: 30,),
                    Text('Motorcycle',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>CarForm()),);
              },
              child: Card(
                elevation: 5,
                child: Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/logo/sport-car.png'),
                    ),
                    SizedBox(width: 30,),
                    Text('Car',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );;
  }
}
