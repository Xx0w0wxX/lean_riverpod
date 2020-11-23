import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:learn_riverpod/models/photo_model.dart';
import 'package:learn_riverpod/states/state_management.dart';

class MyHomePage extends ConsumerWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context,
      T Function<T>(ProviderBase<Object, T> provider) watch) {
    AsyncValue<List<PhotoModel>> photos = watch(photoStateFutureProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: photos.when(
          loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
          error: (err, stack) => Center(
                child: Text('${err.toString()}'),
              ),
          data: (photos) {
            return ListView.builder(
              itemCount: photos.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(photos[index].thumbnailUrl),
                      ),
                      title: Text('${photos[index].title}'),
                    ),
                    Divider(
                      height: 0.5,
                    ),
                  ],
                );
              },
            );
          }),
    );
  }
}
