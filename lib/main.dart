import 'package:flutter/material.dart';
import '../pages/checkout.dart';
import '../pages/home_page_body.dart';
import '../pages/yacht_detail.dart';
import '../scopedModel/connectedModel.dart';
import 'package:scoped_model/scoped_model.dart';

import 'helper/custom_route.dart';
import 'model/yacht.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final YachtModel yachtModel = YachtModel();

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
        model: yachtModel,
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'OpenSans'),
          routes: <String, WidgetBuilder>{
            '/': (_) => const MyHomePage(),
            '/detail': (_) => const YachtDetail(yacht: null,),
            '/checkout': (_) => const Checkout(model: null,)
          },
          onGenerateRoute: (RouteSettings settings) {
            Yacht yacht;
            final List<String> pathElements = settings.name!.split('/');
            if (pathElements[0] == '') {
              return null;
            }
            if (pathElements[0] == 'detail') {
              final String planetId = pathElements[1];
              yacht = yachtModel.allYacht.firstWhere((x) {
                return x.id == planetId;
              });
                return CustomRoute<bool>(
                builder: (context) => YachtDetail(yacht: yacht));
            }
            else if (pathElements[0] == 'checkout') {
              final String planetId = pathElements[1];
              yacht = yachtModel.allYacht.firstWhere((x) {
                return x.id == planetId;
              });
              return CustomRoute<bool>(
                builder: (BuildContext context) => Checkout(model: yacht));
            }

            else {
              return CustomRoute<bool>(
                builder: (context) => const Checkout(),);
            }
          },
          title: 'Flutter Demo',
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child,YachtModel model) => Scaffold(body: HomePageBody(yachtModel: model)),
    );
  }
}

