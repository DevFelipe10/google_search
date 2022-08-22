import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color iconColor = Colors.grey[600]!;

  bool buttonSearchBorder = false;
  bool buttonLuckBorder = false;

  var a = GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    header() => Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: size.width,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.end,
            spacing: 10,
            children: [
              ///[Gmail]
              TextButton(
                  onPressed: () {},
                  child: Text('Gmail', style: TextStyle(color: iconColor))),

              ///[Images]
              TextButton(
                  onPressed: () {},
                  child: Text('Imagens', style: TextStyle(color: iconColor))),

              ///[Apps icon]
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.apps,
                    color: iconColor,
                  )),

              ///[Logo]
              Container(
                alignment: Alignment.center,
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  color: Colors.purple[800],
                ),
                child: const Text('F',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
        );

    body() {
      return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 584),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///[Google's image]
            Image.asset('assets/google_name.png'),

            const SizedBox(height: 20),

            ///[Search input]
            TextFormField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                ///[Border]
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),

                ///[Prefix icon]
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.search,
                    color: iconColor,
                  ),
                ),

                ///[Suffix icons]
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Wrap(
                    verticalDirection: VerticalDirection.down,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.end,
                    runAlignment: WrapAlignment.center,
                    spacing: 15,
                    children: [
                      ///[Keyboard icon]
                      IconButton(
                        icon: Icon(
                          Icons.keyboard,
                          color: iconColor,
                        ),
                        onPressed: () {},
                        style: const ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                        ),
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                      ),

                      ///[Mic icon]
                      InkWell(
                        key: a,
                        overlayColor:
                            MaterialStatePropertyAll(Colors.transparent),
                        child: SvgPicture.asset('assets/mic.svg',
                            semanticsLabel: 'Pesquisa por voz'),
                        onTap: () {
                          print('olá');
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            ///[Buttons]
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 15,
              children: [
                ///[Search Google button]
                OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.grey[200]),
                    shadowColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    side: MaterialStatePropertyAll(
                      BorderSide(
                        color: Colors.grey[400]!,
                        style: buttonSearchBorder
                            ? BorderStyle.solid
                            : BorderStyle.none,
                      ),
                    ),
                  ),
                  onHover: (value) {
                    setState(() => buttonSearchBorder = value);
                  },
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Pesquisa Google',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),

                ///[i'm luck button]
                OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.grey[200]),
                    shadowColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    side: MaterialStatePropertyAll(
                      BorderSide(
                        color: Colors.grey[400]!,
                        style: buttonLuckBorder
                            ? BorderStyle.solid
                            : BorderStyle.none,
                      ),
                    ),
                  ),
                  onHover: (value) {
                    setState(() => buttonLuckBorder = value);
                  },
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Estou com sorte',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Disponibilizado pelo Google em: ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'English',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    footer() => Container(
          width: size.width,
          color: Colors.grey[200],
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text(
                      'Brasil',
                      style: TextStyle(color: iconColor),
                    ),
                  ],
                ),
              ),
              const Divider(height: 5),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  // alignment: Alignment.centerLeft,
                  children: [
                    Wrap(
                      spacing: 10,
                      children: [
                        TextButton(
                            style: const ButtonStyle(
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.zero),
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Sobre',
                              style: TextStyle(color: iconColor),
                            )),
                        TextButton(
                            style: const ButtonStyle(
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.zero),
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Publicidade',
                              style: TextStyle(color: iconColor),
                            )),
                        TextButton(
                            style: const ButtonStyle(
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.zero),
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Negócios',
                              style: TextStyle(color: iconColor),
                            )),
                        TextButton(
                            style: const ButtonStyle(
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.zero),
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Como funciona a Pesquisa',
                              style: TextStyle(color: iconColor),
                            )),
                      ],
                    ),
                    const Spacer(),
                    Wrap(
                      spacing: 10,
                      children: [
                        TextButton(
                            style: const ButtonStyle(
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.zero),
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Privacidade',
                              style: TextStyle(color: iconColor),
                            )),
                        TextButton(
                            style: const ButtonStyle(
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.zero),
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Termos',
                              style: TextStyle(color: iconColor),
                            )),
                        TextButton(
                            style: const ButtonStyle(
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.zero),
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Configurações',
                              style: TextStyle(color: iconColor),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.only(top: 15),
                constraints: BoxConstraints(
                    maxHeight: size.height, maxWidth: size.width),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ///[Header]
                    header(),

                    const Spacer(flex: 1),

                    ///[Body]
                    body(),

                    const Spacer(flex: 5),

                    ///[Footer]
                    footer(),
                  ],
                ),
              );
            }, childCount: 1),
          ),
        ],
      ),
    );
  }
}
