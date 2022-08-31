import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:grupca/constant/button.dart';
import 'package:grupca/theme_data.dart';
import 'package:grupca/constant/size_config.dart';
import 'package:provider/provider.dart';

class CreditCard extends StatefulWidget {
  CreditCard({Key? key}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  String cardNumber = "";

  String expiryDate = "";

  String cardHolderName = "";

  String cvvCode = "";

  bool showBackView = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      showBackView = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context);
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Ödeme'),
        backgroundColor: Colors.transparent,
        toolbarHeight: getProportionateScreenHeight(65),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body: Container(
        decoration: themeData.isDarkMode
            ? const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.black45,
                      Colors.purple,
                    ]),
              )
            : const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white,
                      Color(0xFFD6B02C),
                    ]),
              ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              CreditCardWidget(
                isHolderNameVisible: true,
                labelCardHolder: 'KART SAHIBI',
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isChipVisible: true,
                cvvCode: cvvCode,
                cardBgColor: themeData.isDarkMode
                    ? Colors.purpleAccent
                    : Colors.orangeAccent,
                showBackView: showBackView,
                onCreditCardWidgetChange: (CreditCardBrand creditCard) {},
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CreditCardForm(
                        cardNumber: cardNumber,
                        textColor: Colors.white,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        onCreditCardModelChange: onCreditCardModelChange,
                        themeColor: Colors.white54,
                        formKey: formKey,
                        cardNumberDecoration: InputDecoration(
                          labelText: 'Numara',
                          hintText: 'XXXX XXXX XXXX XXXX',
                          labelStyle: themeData.isDarkMode
                              ? TextStyle(color: Colors.white)
                              : null,
                          hintStyle: themeData.isDarkMode
                              ? TextStyle(color: Colors.white)
                              : null,
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white54, width: 2.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white54, width: 2.0),
                          ),
                        ),
                        expiryDateDecoration: InputDecoration(
                          labelText: 'Son Kullanma',
                          hintText: 'XX/XX',
                          labelStyle: themeData.isDarkMode
                              ? TextStyle(color: Colors.white)
                              : null,
                          hintStyle: themeData.isDarkMode
                              ? TextStyle(color: Colors.white)
                              : null,
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white54, width: 2.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white54, width: 2.0),
                          ),
                        ),
                        cvvCodeDecoration: InputDecoration(
                          labelText: 'CVV',
                          hintText: 'XXX',
                          labelStyle: themeData.isDarkMode
                              ? TextStyle(color: Colors.white)
                              : null,
                          hintStyle: themeData.isDarkMode
                              ? TextStyle(color: Colors.white)
                              : null,
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white54, width: 2.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white54, width: 2.0),
                          ),
                        ),
                        cardHolderDecoration: InputDecoration(
                          labelText: 'Kart Sahibi',
                          hintText: 'XXXXXXXXX',
                          labelStyle: themeData.isDarkMode
                              ? TextStyle(color: Colors.white)
                              : null,
                          hintStyle: themeData.isDarkMode
                              ? TextStyle(color: Colors.white)
                              : null,
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white54, width: 2.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white54, width: 2.0),
                          ),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      Padding(
                        padding: EdgeInsets.only(
                            left: getProportionateScreenHeight(20),
                            right: getProportionateScreenHeight(20)),
                        child: Button(
                          text: 'Tamam',
                          press: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
