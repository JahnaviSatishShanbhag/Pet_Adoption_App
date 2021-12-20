// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import './appbardrawer.dart';

class petdesc extends StatelessWidget {
  const petdesc({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: Appbar(),
      drawer: MainDrawer(),
      backgroundColor: Theme.of(context).primaryColor,
      body: Center (child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CircleAvatar(
                          backgroundColor: Colors.brown,
                          radius: 50,
                        ),

             
              Container(
                 child: const Padding (padding:EdgeInsets.all(20),
                    child:Text("Pet name")
                    ),
                      margin: const EdgeInsets.all(25,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      
                    ),
             
                    Container(
                      child: const Padding (padding:EdgeInsets.all(20),
                    child:Text("description")
                    ),
                      margin: const EdgeInsets.all(25),
                      
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      
                    ),
                    Container(
                      child: const Padding (padding:EdgeInsets.all(20),
                    child:Text("breed")
                    ),
                      margin: const EdgeInsets.all(25),
                      
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      
                    ),
                    Container(
                      child: const Padding (padding:EdgeInsets.all(20),
                    child:Text("location")
                    ),
                      margin: const EdgeInsets.all(25
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      
                    ),
                    Container(
                     child: const Padding (padding:EdgeInsets.all(20),
                    child:Text("contact")
                    ),
                      margin: const EdgeInsets.all(25
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                        
                      ),
                      
                    ),
                    
                
            
          ],
        ),
      ),
    ),);
  }
}