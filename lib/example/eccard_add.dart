import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ECardMainApp());
}

class ECardMainApp extends StatelessWidget {
  const ECardMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ECardModel(),
          )
        ],
        child: MaterialApp(
          title: "青柠记账",
          theme: ThemeData(primarySwatch: Colors.lightBlue),
          home: const ECardMainRoute(),
        ));
  }
}

class ECardMainRoute extends StatefulWidget {
  const ECardMainRoute({super.key});

  @override
  State<ECardMainRoute> createState() => _ECardMainPageRouteState();
}

class _ECardMainPageRouteState extends State<ECardMainRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(45),
              child: AppBar(
                title: const Text("ECard"),
              ),
            ),
            body: Container(
              color: Colors.yellow,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: _MyListItem(),
                    ),
                  ),
                  const Divider(height: 4, color: Colors.black),
                  // _CartTotal()
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  void _incrementCounter() {
    var cart = context.read<ECardModel>();

    ECard item = const ECard("name", "tel", "address", "post");
    cart.add(item);
  }
}

class _MyListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<ECardModel>();

    return ListView.builder(
        itemCount: cart.eCardsList.length,
        itemBuilder: (context, index) {
          ECard eCard = cart.eCardsList[index];
          return Card(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(eCard.name, style: const TextStyle(fontSize: 28)),
                    subtitle: Text(eCard.post),
                  ),
                  ListTile(
                    title: Text(eCard.tel, style: const TextStyle(fontSize: 28)),
                  ),
                  ListTile(
                    title: Text(eCard.address, style: const TextStyle(fontSize: 28)),
                  )
                ],
              ));
        });
  }
}

class ECard {
  final String name;
  final String tel;
  final String address;
  final String post;

  const ECard(this.name, this.tel, this.address, this.post);
}

class ECardModel extends ChangeNotifier {
  final List<ECard> _itemList = [];

  void add(ECard item) {
    _itemList.add(item);
    notifyListeners();
  }

  List<ECard> get eCardsList {
    return _itemList;
  }
}
