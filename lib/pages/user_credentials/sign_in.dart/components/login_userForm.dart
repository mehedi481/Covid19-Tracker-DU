import 'package:covid_19_tracker/helpers/constants/constants.dart';
import 'package:covid_19_tracker/helpers/size_config/size_config.dart';
import 'package:covid_19_tracker/pages/user_credentials/sign_up.dart/sign_up_page.dart';
import 'package:flutter/material.dart';

class LoginUserForm extends StatelessWidget {
  const LoginUserForm({
    Key? key,@required this.formKey,
  }) : super(key: key);
  final formKey ;

  void validateFormField(){
    final form = formKey.currentState;
    if(form.validate()){
      print("Form Valid");
    }
    else{
      print("Form Invalid");
    }
  }

  String? emailValidate(String email){
    if(!emailPhoneValidatorRegExp.hasMatch(email)){
      return kInvalidEmailError;
    }else{
      return null ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: crossStart,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 20),
              Text(
                "Login",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(25),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 35),
              SizedBox(height: 25),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "Enter your Email",
                ),
                validator: (value)=> emailValidate(value!),
              ),
              SizedBox(height: 25),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Enter your Password",
                ),
                validator: (value)=> value!.isEmpty ? kPassNullError : null,
              ),
              SizedBox(height: 35),
              Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: ScreenSize.width * 0.5,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blue,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {
                          validateFormField();
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            fontFamily: "roboto",
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
