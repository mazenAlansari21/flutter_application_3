import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/view/chooseAnimal.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class searchAnimal extends StatefulWidget {
  const searchAnimal({super.key});

  @override
  State<searchAnimal> createState() => _searchAnimalState();
}

class _searchAnimalState extends State<searchAnimal> {
  List display = [];

  Future readData() async {
    var url = "http://192.168.100.48/project/fun/getData.php";

    http.Response r = await http.get(Uri.parse(url));
    if (r.statusCode == 200) {
      var getDataFromDataBase1 = jsonDecode(r.body);

      setState(() {
        display.addAll(getDataFromDataBase1);
      });
      //print(getDataFromDataBase);
    } 
   
  }

  List data = [];
  Future suggestions() async {
    var url = "http://192.168.100.48/project/fun/Suggestions.php";

    http.Response re = await http.get(Uri.parse(url));
    if (re.statusCode == 200) {
      var getDataFromDataBase2 = json.decode(re.body);

      //print(getDataFromDataBase);
      for (int i = 0; i < getDataFromDataBase2.length; i++) {
        setState(() {
          data.add(getDataFromDataBase2[i]["ScientificName"]);
        });
      }
      
    }
    //print(data);
    
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    suggestions();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("search animal"),
        centerTitle: true,
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchA(give: data));
            },
            icon: Icon(Icons.search),
            iconSize: 30,
          ),
        ],
      ),
      bottomNavigationBar: GNav(
        // ignore: prefer_const_literals_to_create_immutables
        tabs: [
          GButton(
            icon: Icons.home,
            text: "home",
            iconColor: Colors.black,
            iconSize: 30,
            onPressed: () {
              Navigator.pushNamed(context, "homePage");
            },
          ),
          GButton(
              icon: Icons.task,
              text: "task",
              iconColor: Colors.black,
              iconSize: 30),
          GButton(
              icon: Icons.search,
              text: "search",
              iconColor: Colors.black,
              iconSize: 30,
              onPressed: () {
                Navigator.pushNamed(context, 'search');
              }),
          GButton(
              icon: Icons.person,
              text: "animal",
              iconColor: Colors.black,
              iconSize: 30,
              onPressed: () {
                Navigator.pushNamed(context, 'MyAnimals');
              }),
        ],
        backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
          itemCount: display.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(9.0),
              child: Container(
                color: Colors.grey[300],
                child: ListTile(
                  onTap: () {
                   Navigator.pushNamed(context, "chooseAnimal");

                    
                  },
                  title: Text("Scientific Name: " +
                      "${display[index]["ScientificName"]}"),
                  subtitle: Text("Rank: " + "${display[index]["Rank"]}"),
                  leading: CircleAvatar(
                    radius: 35,
                    //foregroundImage: NetworkImage("http://192.168.100.48/project/fun/getData.php"),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
            );
          })),
    );
  }
}

class SearchA extends SearchDelegate {
  List give = [];

  Future getAnimalData() async {
    var url = "http://192.168.100.48/project/fun/AnimalSearch.php";
    var re = await http.post(Uri.parse(url), body: {"query": query});

    if (re.statusCode == 200) {
      var getDataFromDataBase3 = jsonDecode(re.body);
      if (getDataFromDataBase3 == "not here") {
        Fluttertoast.showToast(
            gravity: ToastGravity.CENTER,
            msg: "animal does not exist",
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIosWeb: 4,
            backgroundColor: Color.fromARGB(255, 244, 200, 54),
            textColor: Colors.white,
            fontSize: 16.0);
      } else {

        return getDataFromDataBase3;
      }
    }
  }

  SearchA({required this.give}) {}
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.delete))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    getAnimalData();
    return FutureBuilder<dynamic>(
        future: getAnimalData(),
        builder: (stx, snp) {
          if (snp.hasError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snp.hasData) {
            return Text("");
          } else {
            return ListView.builder(
                itemCount: snp.data.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                 
                    title: Text("${snp.data[index]["ScientificName"]}"),
                    subtitle: Text("${snp.data[index]["Rank"]}"),
                  );
                }));
          }
        });
  }

///////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
  @override
  Widget buildSuggestions(BuildContext context) {
    var fromSuggestions = query.isEmpty
        ? give
        : give
            .where(
                (element) => element.toString().toLowerCase().contains(query))
            .toList();
    return ListView.builder(
        itemCount: fromSuggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              query = fromSuggestions[index];
              showResults(context);
            },
            title: Text("${fromSuggestions[index]}"),
          );
        });
  }
}
