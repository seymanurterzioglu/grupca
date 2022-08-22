import 'package:flutter/material.dart';
import 'package:grupca/button.dart';
import 'package:grupca/const.dart';
import 'package:grupca/constant/theme_data.dart';
import 'package:grupca/error.dart';
import 'package:grupca/size_config.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? error;
  bool isPasswordVisible = true;
  bool remember = false;
  List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context);
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Giriş"),
          toolbarHeight: getProportionateScreenHeight(85),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/dog.jpg"), fit: BoxFit.fill)),
          child: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenHeight(20)),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: getProportionateScreenHeight(40)),
                    formEmail(),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    formPassword(),
                    //forgot password
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.brown,
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => const BorderSide(
                                width: 1.0, color: Colors.black87),
                          ),
                          focusColor: Colors.black87,
                          value: remember,
                          onChanged: (value) {
                            setState(() {
                              remember = value!;
                            });
                          },
                        ),
                        const Text(
                          "Hatırla Beni",
                          style: TextStyle(color: Colors.black87),
                        ),
                        SizedBox(width: getProportionateScreenWidth(100)),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Şifremi Unuttum",
                            style: TextStyle(
                              color: Colors.black87,
                              decoration: TextDecoration.overline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    FormError(errors: errors),

                    //Button
                    Padding(
                      padding: EdgeInsets.only(
                          left: getProportionateScreenHeight(20),
                          right: getProportionateScreenHeight(20)),
                      child: Button(
                        text: 'Giriş',
                        press: () {},
                      ),
                    ),
                    if (error != null)
                      Container(
                        child: ListTile(
                          title: Text(error!),
                          leading: Icon(Icons.error),
                          // trailing: IconButton(
                          //   icon: Icon(Icons.close),
                          //   onPressed: () {},
                          // ),
                        ),
                      ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    // if you dont have account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hesabınız yok mu? O zaman ",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: getProportionateScreenWidth(12),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "kayıt olabilirsiniz:)",
                            style: TextStyle(
                              color: themeData.isDarkMode
                                  ? Colors.purple
                                  : Colors.orangeAccent,
                              fontSize: getProportionateScreenWidth(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    logos(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  // google-facebook-twitter logo
  Widget logos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          maxRadius: 15,
            backgroundColor: Colors.white12,
            child: Image.asset('assets/google.png')),
        const SizedBox(width: 24),
        CircleAvatar(
          maxRadius: 15,
            backgroundColor: Colors.white12,
            child: Image.asset('assets/face.png')),
        const SizedBox(width: 24),
        CircleAvatar(
          maxRadius: 15,
            backgroundColor: Colors.white12,
            child: Image.asset('assets/twitter.png')),


      ],
    );
  }

  // Email Form
  TextFormField formEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        setState(() => email = value);
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelStyle: TextStyle(color: Colors.black87),
        hintStyle: TextStyle(color: Colors.black87),
        labelText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.all(20),
        hintText: "Emailinizi Giriniz.",
      ),
    );
  }

  //Password form
  TextFormField formPassword() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        setState(() => password = value);
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Şifre",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.all(20),
        hintText: "Şifrenizi Giriniz.",
        labelStyle: const TextStyle(color: Colors.black87),
        hintStyle: const TextStyle(color: Colors.black87),
        suffixIcon: IconButton(
          icon: isPasswordVisible
              ? const Icon(
                  Icons.visibility,
                  color: Colors.black45,
                )
              : const Icon(Icons.visibility),
          onPressed: () =>
              setState(() => isPasswordVisible = !isPasswordVisible),
        ),
      ),
      obscureText: isPasswordVisible,
      obscuringCharacter: "*",
    );
  }
}
