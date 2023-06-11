import 'dart:developer';

import 'package:consume_api/controllers/post_controller.dart';
import 'package:consume_api/models/post.dart';
import 'package:consume_api/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PostController postcontroller = PostController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Post>>(
          future: postcontroller.fetchAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                inspect(snapshot.data!);
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.01,
                  ),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(snapshot.data![index].toString()),
                          onDismissed: (direction) {
                            postcontroller
                                .delete(snapshot.data![index].id)
                                .then((result) {
                              if (result) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Post Deleted"),
                                  ),
                                );
                                setState(() {});
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Failed to Deleted Post"),
                                  ),
                                );
                                setState(() {});
                              }
                            });
                          },
                          child: Card(
                            child: ListTile(
                              onLongPress: () {
                                AppRoutes.goRouter.pushNamed(
                                  AppRoutes.editPost, 
                                  extra: snapshot.data![index],
                                );
                              },
                              onTap: () {
                                GoRouter.of(context).pushNamed(
                                  AppRoutes.post,
                                  extra: snapshot.data![index],
                                );
                              },
                              title: Text(
                                snapshot.data![index].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                snapshot.data![index].body,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: size.height * 0.0005,
                        );
                      },
                      itemCount: snapshot.data!.length
                      ),
                );
              } else {
                return const Text("No Data");
              }
            } else {
              return const Text("Error");
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          GoRouter.of(context).pushNamed(AppRoutes.addPost);
        },
        label: const Text("Add Post"),
      ),
    );
  }
}