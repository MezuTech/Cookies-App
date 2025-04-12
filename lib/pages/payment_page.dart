import 'package:choco_app/components/checkout_button.dart';
import 'package:choco_app/modules/cart_module.dart';
import 'package:choco_app/themes/app_text.dart';
import 'package:choco_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        title: Icon(
          Icons.check_circle_rounded,
          size: 120.h,
          color: AppColor.secondary,
        ),
        content: SizedBox(
          height: 260.h,
          width: double.infinity,
          child: Column(
            children: [
              Text(
                "Success!",
                style: AppText.boldHeader(
                  fontSize: 70.sp,
                  color: AppColor.secondary,
                ),
                textAlign: TextAlign.center,
              ),
              Gap(20.h),
              Text(
                  "Your payment was successful.\nA reciept foe this purchase has\nbeen sent to your email"),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.secondary,
            ),
            onPressed: () {
              Navigator.of(context).popAndPushNamed("/home");

              context.read<CartModule>().cart.clear();
            },
            child: Text(
              "Back",
            ),
          ),
        ],
      ),
    );
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final priceProvider = context.read<CartModule>().totalPrice;
    final cardProvider = context.watch<CartModule>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Payment",
            style: AppText.regular(),
          ),
          leading: IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(Icons.arrow_back_rounded),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CreditCardWidget(
                cardNumber: cardProvider.cardNumber,
                expiryDate: cardProvider.expiryDate,
                cardHolderName: cardProvider.cardHolderName,
                cvvCode: cardProvider.cvvCode,
                showBackView: true,
                obscureCardCvv: true,
                obscureInitialCardNumber: true,
                isHolderNameVisible: true,
                isSwipeGestureEnabled: true,
                cardBgColor: AppColor.secondary,
                enableFloatingCard: true,
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              ),
              CreditCardForm(
                cardNumber: cardProvider.cardNumber,
                expiryDate: cardProvider.expiryDate,
                cardHolderName: cardProvider.cardHolderName,
                cvvCode: cardProvider.cvvCode,
                onCreditCardModelChange: cardProvider.updateCreditCardDetails,
                formKey: formKey,
                obscureCvv: true,
                inputConfiguration: InputConfiguration(
                  cardNumberDecoration: const InputDecoration(
                    labelStyle: TextStyle(
                      color: AppColor.grey,
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Card Number',
                    hintText: 'XXXX XXXX XXXX XXXX',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.secondary,
                      ),
                    ),
                  ),
                  expiryDateDecoration: const InputDecoration(
                    labelStyle: TextStyle(
                      color: AppColor.grey,
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Expiry Date',
                    hintText: 'MM/YY',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.secondary,
                      ),
                    ),
                  ),
                  cardHolderDecoration: const InputDecoration(
                    labelStyle: TextStyle(
                      color: AppColor.grey,
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Card Holder',
                    hintText: 'Holders Name',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.secondary,
                      ),
                    ),
                  ),
                  cvvCodeDecoration: const InputDecoration(
                    labelStyle: TextStyle(
                      color: AppColor.grey,
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Cvv Code',
                    hintText: 'XXXX',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.secondary,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  CheckoutButton(
                      width: 290.w,
                      text: "Total: \$${priceProvider.toStringAsFixed(2)}"),
                  CheckoutButton(
                    text: "Pay Now",
                    width: 290.w,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        showSuccessDialog();
                      }
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
