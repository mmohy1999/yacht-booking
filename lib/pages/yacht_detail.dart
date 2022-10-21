import 'package:flutter/material.dart';
import '../model/yacht.dart';
import '../widget_and_style/submit_button.dart';
import '../widget_and_style/text_style.dart';

class YachtDetail extends StatefulWidget {
  final Yacht? yacht;
  const YachtDetail({Key? key, required this.yacht}) : super(key: key);

  @override
  State<YachtDetail> createState() => _YachtDetailState();
}

class _YachtDetailState extends State<YachtDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xff1a5ddd),
                )
              ],
            ),
            _body()
          ],
        ));
  }

  Widget _body() {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20, left: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon(Icons.chevron_left),
              GestureDetector(
                child: const Icon(
                  IconData(
                    0xeab5,
                    fontFamily: 'icofont',
                  ),
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                padding: const EdgeInsets.only(right: 35),
                child: const Icon(Icons.favorite_border, color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50,),
                  Text(
                    widget.yacht!.name,
                    style: headerTextStyle,
                  ),
                  const Text(
                    'yacht',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  RichText(
                    text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: '\$${widget.yacht!.price}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                decoration: TextDecoration.none,
                              )),
                          const TextSpan(
                              text: ' / day',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 10,
                                decoration: TextDecoration.none,
                              )),
                        ]),
                  ),
                  // Text(
                  //   '\$1000 / Day',
                  //   style: TextStyle(color: Colors.white, fontSize: 18),
                  // ),
                  const SizedBox(
                    height: 70,
                  ),
                  _rotatedBox('Length',widget.yacht!.length),
                  const SizedBox(
                    height: 20,
                  ),
                  _rotatedBox('Width',widget.yacht!.height),
                  const SizedBox(
                    height: 20,
                  ),
                  _rotatedBox('Draft',widget.yacht!.draft),
                ],
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.only(top: 50),
                    width: 180,
                    alignment: FractionalOffset.centerRight,
                    height: 520,
                    child: RotatedBox(
                      quarterTurns: 4,
                      child: Image.asset(
                        widget.yacht!.detailImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          SubmitButton(buttonText: 'Pay now',navigationString: 'checkout/${widget.yacht!.id}',navToBack: false,)

        ],
      ),
    );
  }

  Widget _rotatedBox(String text,String length) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white54),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: length,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        decoration: TextDecoration.none,
                      )),
                  const TextSpan(
                      text: ' m',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 15,
                        decoration: TextDecoration.none,
                      )),
                ]),
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white60, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
