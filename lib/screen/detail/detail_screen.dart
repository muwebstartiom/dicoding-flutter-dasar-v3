import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s2/provider/detail/resto_detail_provider.dart';
import 'package:s2/screen/detail/body_of_detail_screen_widget.dart';
import 'package:s2/static/resto_detail_result_state.dart';

class DetailScreen extends StatefulWidget {
  final String restoId;

  const DetailScreen({super.key, required this.restoId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<RestoDetailProvider>().fetchRestoDetail(widget.restoId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Resto Detail")),
      body: Consumer<RestoDetailProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            RestoDetailLoadingState() => const Center(
              child: CircularProgressIndicator(),
            ),
            RestoDetailLoadedState(data: var resto) => BodyOfDetailScreenWidget(
              restoDetail: resto,
            ),
            RestoDetailErrorState(error: var message) => Center(
              child: Text(message),
            ),
            _ => const SizedBox(),
          };
        },
      ),
    );
  }
}
