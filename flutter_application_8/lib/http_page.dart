import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_8/album_model.dart';
import 'package:http/http.dart' as http;

class AlbumHttpProvider {
  Future<List<AlbumModel>> fetchAlbums() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );

    final list = jsonDecode(response.body);
    print("get");

    return (list as List).map((e) => AlbumModel.fromJson(e)).toList();
  }

  Future<int> createAlbum(AlbumModel a) async {
    final response = await http.post(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      body: jsonEncode(a),
    );

    return response.statusCode;
  }
}

class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  late final AlbumHttpProvider albumHttpProvider;
  Future<List<AlbumModel>>? future;

  @override
  void initState() {
    super.initState();

    albumHttpProvider = AlbumHttpProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        future = albumHttpProvider.fetchAlbums();
                      });
                    },
                    child: Text("Get"),
                  ),

                  ElevatedButton(
                    onPressed: () async {
                      final result = await albumHttpProvider.createAlbum(
                        AlbumModel(
                          userId: 1,
                          id: 1,
                          title: "title",
                          body: "body",
                        ),
                      );

                      if (mounted) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(title: Text("Code: ${result}"));
                          },
                        );
                      }
                    },
                    child: Text("Post"),
                  ),
                ],
              ),

              FutureBuilder(
                future: future,
                builder: (context, snapshot) {
                  if (snapshot.data != null && snapshot.hasData) {
                    return Column(
                      children: [
                        ...snapshot.data?.map((e) => Row(
                              children: [
                                Text("ID: ${e.id}"),
                                Expanded(child: Text("Title: ${e.title}")),
                              ],
                            ),
                          ) ??
                        [],
                      ],
                    );
                  }

                  return Text("No data");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}