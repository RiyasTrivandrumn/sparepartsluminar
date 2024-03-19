import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:spare_parts/presentation/views/cartpage/controller/cart_controller.dart';
import 'package:spare_parts/presentation/views/checkoutPage/service/checkService.dart';
import 'package:spare_parts/presentation/views/checkoutPage/widgets/checktile.dart';
import 'package:spare_parts/presentation/views/innerScreens/innerhome/innerHome.dart';
import 'package:spare_parts/utils/text_sizes.dart';

class CheckOut extends StatefulWidget {
  CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final _razorpay = Razorpay();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController adressController = TextEditingController();

  void openCheckout(amount) {
    amount = amount * 100;

    var options = {
      'method': {
        'netbanking': true,
        'card': true,
        'upi': true,
        'wallet': true,
      },
      'key': 'rzp_test_uRWyf2SUzmHtw9',
      'amount': amount,
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
    await CheckOutService.placeOrder(adress: adressController.text.trim());
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>InnerHome() ,
        ),
        (route) => false);

    Fluttertoast.showToast(
        msg: "Payment Succesful" + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);


  }

  void handlePaymentError(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Fail" + response.paymentId!,
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
              height: 160,
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
                "Order Summary",
                style: CustomStyle.Checkout,
              ),
            ),
            Divider(
              thickness: 5,
              color: Colors.grey.shade300,
            ),
            Consumer<CartController>(
              builder: (context, value, child) {
                return ListView.separated(
                  itemCount: value.model?.cart?.length ?? 0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = value.model!.cart![index];
                    return CheckCard(
                      title: item.itemDetails?.itemName,
                      image: item.itemDetails?.itemImage,
                      quantity: item.quantity,
                      price: item.itemDetails?.price,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 2,
                    );
                  },
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Divider(
                thickness: 5,
                color: Colors.grey.shade300,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<CartController>(
                      builder: (context, value, child) {
                        return Text(
                          "Total Price:₹${value.model?.total} ",
                          style: CustomStyle.Checkout,
                        );
                      },
                    )),
                Divider(
                  thickness: 5,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
          ],
        ),
      )),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.yellow.shade600,
        child: Center(child: Consumer<CartController>(
          builder: (context, value, child) {
            return InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    openCheckout(value.model!.total);
                  }
                },
                child: Text(
                  "Proceed to pay",
                  style: CustomStyle.DescriptionTitle,
                ));
          },
        )),
      ),
    );
  }
}
