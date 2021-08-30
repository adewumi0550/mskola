import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mskola/constraints/Color.dart';

class PhoneSignUp extends StatefulWidget {
  const PhoneSignUp({Key? key}) : super(key: key);

  @override
  _PhoneSignUpState createState() => _PhoneSignUpState();
}

class _PhoneSignUpState extends State<PhoneSignUp> {
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final TextEditingController controller = TextEditingController();
    String initialCountry = 'NG';
    PhoneNumber number = PhoneNumber(isoCode: 'NG');

    
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height*0.07,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Enter your phone number', style: TextStyle(
                    fontSize: 16,
                    color: blackColor,
                    fontWeight: FontWeight.w400),),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: number,
                  textFieldController: controller,
                  formatInput: false,
                  keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
                  // inputBorder: OutlineInputBorder(),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
              ),
              

              SizedBox(height: MediaQuery.of(context).size.height*0.09,),

              button(),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('By  clicking SIGN UP you agree to our Terms of Use & have read and acknowledge our Privacy Statement'),
              ),

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
                  'SIGN UP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
                onPressed: () async {




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

  Widget phoneNumber(){
    return  Padding(
      padding: const EdgeInsets.all(30.0),
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) {
          print(number.phoneNumber);
        },
        onInputValidated: (bool value) {
          print(value);
        },
        selectorConfig: SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        ),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: TextStyle(color: Colors.black),
        // initialValue: number,
        // textFieldController: controller,
        formatInput: false,
        keyboardType:
        TextInputType.numberWithOptions(signed: true, decimal: true),
        // inputBorder: OutlineInputBorder(),
        onSaved: (PhoneNumber number) {
          print('On Saved: $number');
        },
      ),
    );
  }
}
