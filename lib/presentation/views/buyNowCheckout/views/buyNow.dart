import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:spare_parts/presentation/orderHistory/order_history.dart';
import 'package:spare_parts/presentation/views/buyNowCheckout/service/buy_checkout_ser.dart';
import 'package:spare_parts/utils/apputils.dart';
import 'package:spare_parts/utils/text_sizes.dart';

class ByNowCheckout extends StatefulWidget {
  final String image;
  final String title;
  final String price;
  final int id;

  ByNowCheckout(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.id});

  @override
  State<ByNowCheckout> createState() => _ByNowCheckoutState();
}

class _ByNowCheckoutState extends State<ByNowCheckout> {
  final _razorpay = Razorpay();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController adressController = TextEditingController();

  final TextEditingController notesController = TextEditingController();

  void openCheckout(amount) {
    double doubleValue = double.parse(amount);
    int value = doubleValue.toInt();

    value = value * 100;

    var options = {
      'method': {
        'netbanking': true,
        'card': true,
        'upi': true,
        'wallet': true,
      },
      'key': 'rzp_test_uRWyf2SUzmHtw9',
      'amount': value,
      'name': 'Prestige Pvt Ltd',
      'prefill': {'contact': '7563773474', 'email': 'prestige8@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) async {
    await CheckOutService.setData(
            id: widget.id,
            address: adressController.text.trim(),
            notes: notesController.text.trim())
        .then((_) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => History(),
              ),
            ));

    Fluttertoast.showToast(
        msg: "Payment Succesful" + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    print(response.message);
    Fluttertoast.showToast(
        msg: "Payment Fail" + response.message.toString(),
        toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "Wxternal Wallet" + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text(
          "Checkout",
          style: CustomStyle.CartHeadder,
        ),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 255,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery Address",
                      style: CustomStyle.Checkout,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Delivery Address';
                        }
                        return null;
                      },
                      controller: adressController,
                      decoration: InputDecoration(
                        hintText: "Please enter your Delivery Adress",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Delivery notes';
                        }
                        return null;
                      },
                      controller: notesController,
                      decoration: InputDecoration(
                        hintText: "Please enter your Delivery notes",
                        border: OutlineInputBorder(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 5,
              color: Colors.grey.shade300,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Product details",
                style: CustomStyle.Checkout,
              ),
            ),
            Divider(
              thickness: 5,
              color: Colors.grey.shade300,
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                height: 140,
                child: Row(
                  children: [
                    Image.network(AppUtils.baseUrl + widget.image),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: CustomStyle.LargeTextStyle,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "₹" + widget.price,
                              style: CustomStyle.PriceText,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.yellow.shade600,
        child: Center(
            child: InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    openCheckout(widget.price);
                  }
                },
                child: Text(
                  "Proceed to pay",
                  style: CustomStyle.DescriptionTitle,
                ))),
      ),
    );
  }
}
