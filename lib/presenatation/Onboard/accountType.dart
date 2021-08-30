import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mskola/constraints/Color.dart';
import 'package:mskola/presenatation/signup/phoneSignup.dart';

class AccountType extends StatefulWidget {
  const AccountType({Key? key}) : super(key: key);

  @override
  _AccountTypeState createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(top:20.0,left: 20.0,bottom: 10.0),
              child: Text('Select Account Type', style: TextStyle(color: blackColor,fontSize: 24,fontWeight: FontWeight.w700),),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Please select the type of account you want to sign up for', style: TextStyle(color: blackColor,fontSize: 16,fontWeight: FontWeight.w400),),
            ),

            SizedBox(height: 20.0,),
            cardTitle(title: 'I am a parent', content: 'Back to school-pana 1.png', subTitle:'You would have \n access to monitor \nyour child’s progress'),
            SizedBox(height: 20.0,),
            cardTitle(title: 'I am a student', content: 'Children preparing their backpack-cuate.png', subTitle:'Get to enjoy learning \n in a different way  '),

          ],
        ),
      ),
    );
  }

  Widget cardTitle({required title, required content, subTitle}){

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PhoneSignUp()),
          );
        },
        child: Container(
          height: 160.0,
          width: 338,
          child: Card(
            child: Row(
              children: <Widget>[
                Image.asset('assets/images/$content'),
                // RichText(
                //   text: TextSpan(
                //     style: TextStyle(color: Colors.black, fontSize: 36),
                //     children: <TextSpan>[
                //       TextSpan(text: 'Connect with', ),
                //       TextSpan(text: '\n You would have access to monitor your child’s progress ', style: TextStyle(color: secondaryColor, fontWeight: FontWeight.w700, fontSize: 50)),
                //     ],
                //   ),
                //   textScaleFactor: 0.5,
                // ),

                Padding(
                  padding: const EdgeInsets.only(top:18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                      ),
                      Expanded(child: Text(subTitle, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),)

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
