import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s2/provider/home/resto_search_provider.dart' as search_provider;
import 'package:s2/screen/home/resto_card_widget.dart';
import 'package:s2/static/navigation_route.dart';
import 'package:s2/static/resto_search_result_state.dart';

class RestoSearchScreen extends StatelessWidget {
  const RestoSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari restoran di sini',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (query) {
                context.read<search_provider.RestoSearchProvider>().searchResto(
                  query,
                );
              },
            ),
          ),
          Expanded(
            child: Consumer<search_provider.RestoSearchProvider>(
              builder: (context, provider, _) {
                if (provider.state is RestoSearchInitial) {
                  return const Center(
                    child: Text(
                      'Masukkan kata kunci untuk menemukan restoran anda.',
                    ),
                  );
                } else if (provider.state is RestoSearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (provider.state is RestoSearchLoaded) {
                  final restos = (provider.state as RestoSearchLoaded).result;
                  if (restos.isEmpty) {
                    return const Center(
                      child: Text('Tidak ada restoran yang ditemukan.'),
                    );
                  }
                  return ListView.builder(
                    itemCount: restos.length,
                    itemBuilder: (context, index) {
                      return RestoCard(
                        resto: restos[index],
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            NavigationRoute.detailRoute.name,
                            arguments:
                                restos[index].id, // kirim id ke DetailScreen
                          );
                        },
                      );
                    },
                  );
                } else if (provider.state is RestoSearchError) {
                  final error = (provider.state as RestoSearchError).message;
                  return Center(child: Text(error));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
