import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mskola/constraints/Color.dart';
import 'package:mskola/presenatation/Onboard/accountType.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              Image.asset('assets/images/connected_world.png'),
              SizedBox(height: 36,),
              Container(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 36),
                    children: <TextSpan>[
                      TextSpan(text: 'Connect with', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 50)),
                      TextSpan(text: '\n   mSkola ', style: TextStyle(color: secondaryColor, fontWeight: FontWeight.w700, fontSize: 50)),
                    ],
                  ),
                  textScaleFactor: 0.5,
                ),),
              SizedBox(height: 36,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: Text('Teachers, Parent & Students in one place',style: TextStyle(color: Colors.black87,fontSize: 16))),
              ),

              new SizedBox(height: 40,),
              button(),

             new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Already have an Account?', style: TextStyle(fontSize: 16),),
                  TextButton(onPressed: (){

                  }, child: Text('Log in', style: TextStyle(color: secondaryColor,fontSize: 16),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget button() {


    return   Padding(
        padding: const EdgeInsets.only(left:20.0,right: 20,bottom: 10.0,),
        child:   Container(
            child: MaterialButton(
                minWidth: double.infinity,
                height: 40.0,
                color: secondaryColor,
                elevation: 0,
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      ),
                ),
                onPressed: () async {


                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      AccountType()), (Route<dynamic> route) => false);

                  // if (_key.currentState.validate()) {
                  //   // If the form is valid, display a snackbar. In the real world,
                  //   // you'd often call a server or save the information in a database.
                  //
                  //   print(_emailController.text);
                  //   print(_passwordController.text);
                  //
                  //
                  //   try{
                  //     if(_passwordController.text != null && _emailController.text != null) {
                  //
                  //       String uid = await _authServices.signInWithEmailAndPassword(context, _emailController.text, _passwordController.text);
                  //       print("Signed in $uid");
                  //       // Scaffold
                  //       //     .of(context)
                  //       //     .showSnackBar(SnackBar(content: Text('Login Successful')));
                  //       if(uid != null){
                  //         Navigator.of(context).pushReplacementNamed('/home');
                  //
                  //       }else{
                  //         SignInScreen();
                  //       }
                  //     }}catch(e) {
                  //     print(e);
                  //   }
                  // };
                })
        )

    );
  }

}
