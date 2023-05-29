import 'package:arz/Model/Currency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:developer' as developer;
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "iranyekanweb",
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              color: Colors.black,
              fontFamily: "iranyekanweb",
              fontSize: 16,
              fontWeight: FontWeight.w700),
          bodyLarge: TextStyle(
              color: Color.fromARGB(255, 30, 30, 30),
              fontFamily: "iranyekanweb",
              fontSize: 13,
              fontWeight: FontWeight.w300),
          displayMedium: TextStyle(
              color: Colors.white,
              fontFamily: "iranyekanweb",
              fontSize: 14,
              fontWeight: FontWeight.w300),
          bodyMedium: TextStyle(
              color: Colors.black,
              fontFamily: "iranyekanweb",
              fontSize: 14,
              fontWeight: FontWeight.w300),
          headlineMedium: TextStyle(
              color: Colors.green,
              fontFamily: "iranyekanweb",
              fontSize: 14,
              fontWeight: FontWeight.w300),
          headlineSmall: TextStyle(
              color: Colors.red,
              fontFamily: "iranyekanweb",
              fontSize: 14,
              fontWeight: FontWeight.w300),
        ),
      ),
      title: "arz",
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('fa', '')],
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Currency> currency = [];

  Future getResponse(BuildContext cntx) async {
    var url = "http://sasansafari.com/flutter/api.php?access_key=flutter123456";
    var value = await http.get(Uri.parse(url));
    developer.log(value.body, name: "main");
    if (currency.isEmpty) {
      if (value.statusCode == 200) {
        _showSnackBar(context, "بروزرسانی با موفقیت انجام شد.");
        developer.log(value.body,
            name: "getResponse", error: convert.jsonDecode(value.body));
        List jsonList = convert.jsonDecode(value.body);
        if (jsonList.isNotEmpty) {
          for (int i = 0; i < jsonList.length; i++) {
            setState(() {
              currency.add(Currency(
                  id: jsonList[i]["id"],
                  title: jsonList[i]["title"],
                  price: jsonList[i]["price"],
                  changes: jsonList[i]["changes"],
                  status: jsonList[i]["status"]));
            });
          }
        }
      }
    }
    return value;
  }

  @override
  void initState() {
    super.initState();
    developer.log("initstate", name: "wlifeCycle");
    getResponse(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    developer.log("didChangeDependencies", name: "wlifeCycle");
  }

  @override
  void didUpdateWidget(covariant Home oldWidget) {
    super.didUpdateWidget(oldWidget);
    developer.log("didUpdateWidget", name: "wlifeCycle");
  }

  // @override
  // void setState(VoidCallback fn) {
  //   super.setState(fn);
  //   developer.log("setState", name: "wlifeCycle");
  // }

  // @override
  // void deactivate() {
  //   super.deactivate();
  //   developer.log("deactivate", name: "wlifeCycle");
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   developer.log("dispose", name: "wlifeCycle");
  // }

  @override
  Widget build(BuildContext context) {
    developer.log("bulid", name: "wlifeCycle");

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 24),
            child: Align(
                alignment: Alignment.center,
                child: Image.asset("assets/images/icon.png")),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Text(
                "قیمت به روز سکه و ارز",
                style: Theme.of(context).textTheme.displayLarge,
              )),
          Expanded(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset("assets/images/menu.png"))),
          const SizedBox(
            width: 27,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(right: 26, top: 23, left: 26, bottom: 37),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset("assets/images/question.png"),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "نرخ ارز آزاد چیست؟ ",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                " نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.",
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 26, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: 34,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 130, 130, 130),
                      borderRadius: BorderRadius.all(Radius.circular(1000))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "نام آزاد ارز",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        "قیمت",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        "تغییر",
                        style: Theme.of(context).textTheme.displayMedium,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                child: listFutureBuilder(context),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                  height: MediaQuery.of(context).size.height / 16,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromARGB(255, 232, 232, 232),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 16,
                        child: TextButton.icon(
                            onPressed: () {
                              currency.clear();
                              listFutureBuilder(context);
                            },
                            icon: const Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Icon(
                                CupertinoIcons.refresh,
                                color: Colors.black,
                              ),
                            ),
                            label: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                "بروزرسانی",
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 202, 193, 255)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)),
                                ))),
                      ),
                      Text(
                        "آخرین بروزرسانی ${_getTime()}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 8)
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<dynamic> listFutureBuilder(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: currency.length,
                itemBuilder: (BuildContext context, int position) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: MyItem(position, currency),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  if (index % 9 == 0) {
                    return const Padding(
                      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: AD(),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
      future: getResponse(context),
    );
  }
}

String _getTime() {
  DateTime now = DateTime.now();
  return DateFormat('kk:mm').format(now);
}

void _showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: Theme.of(context).textTheme.displayLarge,
      ),
      backgroundColor: Colors.green));
}

// ignore: must_be_immutable
class MyItem extends StatelessWidget {
  int position;
  List<Currency> currency;

  MyItem(this.position, this.currency, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: 54,
      decoration: BoxDecoration(boxShadow: const <BoxShadow>[
        BoxShadow(blurRadius: 3.0, color: Colors.grey)
      ], color: Colors.white, borderRadius: BorderRadius.circular(1000)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 6,
          child: Text(
            currency[position].title!,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 6,
          child: Text(
            getFarsiNumber(currency[position].price.toString()),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(getFarsiNumber(currency[position].changes.toString()),
              style: currency[position].status == "n"
                  ? Theme.of(context).textTheme.headlineSmall
                  : Theme.of(context).textTheme.headlineMedium),
        ),
      ]),
    );
  }
}

class AD extends StatelessWidget {
  const AD({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 54,
      decoration: BoxDecoration(boxShadow: const <BoxShadow>[
        BoxShadow(blurRadius: 3.0, color: Colors.grey)
      ], color: Colors.red, borderRadius: BorderRadius.circular(1000)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(
          "تبلیغات",
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ]),
    );
  }
}

String getFarsiNumber(String number) {
  const en = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const fa = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

  en.forEach((element) {
    number = number.replaceAll(element, fa[en.indexOf(element)]);
  });

  return number;
}
