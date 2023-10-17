import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../Components/Helpers/apihelpers.dart';
import '../Model/apimodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search = TextEditingController();
  String searchData = "";
  Connectivity connectivity = Connectivity();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "RNW NEWS",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: connectivity.onConnectivityChanged,
        builder: (
          BuildContext context,
          AsyncSnapshot<ConnectivityResult> snapshot,
        ) {
          return (snapshot.data == ConnectivityResult.mobile ||
                  snapshot.data == ConnectivityResult.wifi)
              ? Column(
                  children: [
                    Expanded(
                      child: FutureBuilder(
                        future: Api_Helper.api.News(search: searchData),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          } else if (snapshot.hasData) {
                            List<News_Model>? alldata = snapshot.data;
                            return Column(
                              children: [
                                Container(
                                  height: h * .1,
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    onEditingComplete: () {
                                      setState(() {
                                        searchData = search.text;
                                      });
                                      search.clear();
                                    },
                                    controller: search,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white.withOpacity(.5),
                                        suffix: IconButton(
                                          icon: const Icon(
                                            Icons.search,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              searchData = search.text;
                                            });
                                            search.clear();
                                          },
                                        ),
                                        hintText: "Search Hear........"),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: alldata?.length,
                                    itemBuilder: (context, i) => Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, 'details',
                                                arguments: alldata?[i]);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            height: h * .4,
                                            width: w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "${alldata?[i].image}"),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: 10,
                                          ),
                                          height: h * .06,
                                          width: w,
                                          child: Text(
                                            "${alldata?[i].title}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Divider(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Container(
                    height: 450,
                    width: 500,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "lib/Components/Utils/Assets/1032240469662498819.jpeg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
