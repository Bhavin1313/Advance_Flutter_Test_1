import 'package:advance_flutter_test_1/Model/apimodel.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    News_Model data = ModalRoute.of(context)!.settings.arguments as News_Model;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        title: Text(
          "${data.author}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: h * .4,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage("${data.image}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Divider(
              height: 20,
              thickness: 5,
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: h * .4,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Title : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          "${data.title}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Author : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          "${data.author}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          "${data.description}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Url : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          "${data.url}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Source : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          "${data.source}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
