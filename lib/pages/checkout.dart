import 'package:flutter/material.dart';
import '../model/yacht.dart';
import '../widget_and_style/submit_button.dart';


class Checkout extends StatefulWidget {
  final Yacht? model;
   const Checkout({Key? key,  this.model}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> with TickerProviderStateMixin{
  int no = 1;
  bool masterCardEnable = true;
  bool visaEnable = false;
  late String price;
  late AnimationController _controllerMasterCard;
  late AnimationController _controllerVisaCard;
  late Animation<double> _animationMasterCard;
  late Animation<double> _animationVisaCard;
  @override
  void initState() {
   price = widget.model!.price;
    _controllerMasterCard =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _animationMasterCard = Tween<double>(begin: .8, end: 1).animate(
        CurvedAnimation(parent: _controllerMasterCard, curve: Curves.easeIn));

    _controllerVisaCard =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _controllerVisaCard = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _animationVisaCard = Tween<double>(begin: .8, end: 1).animate(
        CurvedAnimation(parent: _controllerVisaCard, curve: Curves.easeIn));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: const Icon(
              IconData(
                0xeab5,
                fontFamily: 'icofont',
              ),
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Checkout',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Days',
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 36,
                    width: 110,
                    decoration: BoxDecoration(
                        color: const Color(0xff1a5ddd),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                              height: 26,
                              width: 26,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: const Center(
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              )),
                          onTap: () {
                            setState(() {
                              if (no > 1) {
                                --no;
                                int i = int.tryParse(widget.model!.price)! * no;
                                price = i.toString();
                              }
                            });
                          },
                        ),
                        Text(
                          no.toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        GestureDetector(
                          child: Container(
                              height: 26,
                              width: 26,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: Colors.white),
                              child: const Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(fontSize: 20),
                                ),
                              )),
                          onTap: () {
                            setState(() {
                              no = no + 1;
                              int i = int.tryParse(widget.model!.price)! * no;
                              price = i.toString();
                            });
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: 60,
                width: 2,
                color: Colors.grey,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: FractionalOffset.centerLeft,
                    width: 100,
                    child: Text(
                      '\$$price',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 90,
          ),
          _middleSection(),
          const SizedBox(height: 60,),
          const SubmitButton(buttonText: 'Rent now',navToBack: true,)
        ],
      ),
    );
  }

  Widget _middleSection() {
    return Column(
      children: [
        const Text(
          'Payment Cards',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            ScaleTransition(
              scale: _animationMasterCard,
              alignment: Alignment.center,
              child: GestureDetector(
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width / 2 - 28,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: masterCardEnable
                            ? const Color(0xffd1d1e1)
                            : const Color(0xFFFFFFFF),
                        blurRadius: 10,
                        offset: const Offset(0, 10),
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: masterCardEnable
                        ? const Color(0xff1a5ddd)
                        : const Color(0xfff5f3fb),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '**** 2019',
                        style: TextStyle(
                            color:
                            masterCardEnable ? Colors.white : Colors.black),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Text(
                        '\$23 890',
                        style: TextStyle(
                            color:
                            masterCardEnable ? Colors.white : Colors.black,
                            fontSize: 25),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Platinum',
                            style: TextStyle(
                                color: masterCardEnable
                                    ? Colors.white54
                                    : Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Image.asset('assets/image/masterCardLogo.png',
                              height: 25)
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    masterCardEnable = true;
                    visaEnable = false;
                    _controllerMasterCard.forward();
                    _controllerVisaCard.reverse();

                  });
                },
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            ScaleTransition(
              scale: _animationVisaCard,
              child: GestureDetector(
                child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width / 2 - 32,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: visaEnable ? const Color(0xff1a5ddd) : const Color(0xfff5f3fb),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: visaEnable
                              ? const Color(0xffd1d1e1)
                              : const Color(0xFFFFFFFF),
                          blurRadius: 10,
                          offset: const Offset(0, 10),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '**** 3456',
                          style: TextStyle(
                              color: visaEnable ? Colors.white : Colors.black),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '\$15 000',
                          style: TextStyle(
                              color: visaEnable ? Colors.white : Colors.black,
                              fontSize: 25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Platinum',
                              style: TextStyle(
                                  color:
                                  visaEnable ? Colors.white : Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            Image.asset('assets/image/visaCardLogo.png',
                                height: 15),
                          ],
                        )
                      ],
                    )),
                onTap: () {
                  setState(() {
                    visaEnable = true;
                    masterCardEnable = false;
                    _controllerMasterCard.reverse();
                    _controllerVisaCard.forward();
                  });
                },
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  dispose() {
    _controllerMasterCard.dispose();
    super.dispose();
  }
}


