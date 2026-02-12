import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_8/album_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_8/rest_album_provider.dart';

// В комментариях - стандартное обращение через мой не сгенерированный провайдер
class AlbumHttpProvider {
  final Dio dio = Dio();

  Future<List<AlbumModel>> fetchAlbums() async {
    final response = await dio.get(
      "https://jsonplaceholder.typicode.com/posts",
    );

    return (response.data as List).map((e) => AlbumModel.fromJson(e)).toList();
  }

  Future<int> createAlbum(AlbumModel a) async {
    final response = await dio.post(
      "https://jsonplaceholder.typicode.com/posts",
      data: a,
    );

    return response.statusCode ?? 0;
  }
}

class DioPage extends StatefulWidget {
  const DioPage({super.key});

  @override
  State<DioPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<DioPage> {
  late final AlbumHttpProvider albumHttpProvider;
  late final RestAlbumProvider restAlbumProvider; // Сгенерированный провайдер

  Future<List<AlbumModel>>? future;

  @override
  void initState() {
    super.initState();

    albumHttpProvider = AlbumHttpProvider();
    restAlbumProvider = RestAlbumProvider(Dio());
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
                        //future = albumHttpProvider.fetchAlbums();
                        future = restAlbumProvider.fetchAlbums();
                      });
                    },
                    child: Text("Get"),
                  ),

                  ElevatedButton(
                    onPressed: () async {
                      // final result = await albumHttpProvider.createAlbum(
                      //   AlbumModel(
                      //     userId: 1,
                      //     id: 1,
                      //     title: "title",
                      //     body: "body",
                      //   ),
                      // );

                      final result = await restAlbumProvider.createAlbum(
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
                            return AlertDialog(
                              title: Text(
                                "Code: ${result.response.statusCode}",
                              ),
                            );
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
                        ...snapshot.data?.map(
                              (e) => Row(
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