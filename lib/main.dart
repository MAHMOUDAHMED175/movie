import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movei_api/core/observer.dart';
import 'core/services/services_locator.dart';
import 'mobile_movei/presentation/screens/movies_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();

   ServicesLocator().setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white54
      ),
      home: MoviesScreen(),
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: CustomScrollingWidget(),
//     );
//   }
// }
//
// class CustomScrollingWidget extends StatefulWidget {
//   const CustomScrollingWidget({Key? key}) : super(key: key);
//
//   @override
//   State createState() => _CustomScrollingWidgetState();
// }
//
// class _CustomScrollingWidgetState extends State {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           const SliverAppBar(
//             pinned: false,
//             expandedHeight: 250.0,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text('CustomScrollView'),
//               centerTitle: true,
//             ),
//           ),
//           // SliverToBoxAdapter(
//           //   child: Container(
//           //     color: Colors.tealAccent,
//           //     alignment: Alignment.center,
//           //     height: 200,
//           //     child: const Text('This is Container'),
//           //   ),
//           // ),
//           // SliverGrid(
//           //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//           //     maxCrossAxisExtent: 200.0,
//           //     mainAxisSpacing: 10.0,
//           //     crossAxisSpacing: 10.0,
//           //     childAspectRatio: 4.0,
//           //   ),
//           //   delegate: SliverChildBuilderDelegate(
//           //     (BuildContext context, int index) {
//           //       return Container(
//           //         alignment: Alignment.center,
//           //         color: Colors.teal[100 * (index % 9)],
//           //         child: Text('Grid Item $index'),
//           //       );
//           //     },
//           //     childCount: 5,
//           //   ),
//           // ),
//           // SliverToBoxAdapter(
//           //   child: Container(
//           //     color: Colors.amberAccent,
//           //     alignment: Alignment.center,
//           //     height: 200,
//           //     child: const Text('This is Container'),
//           //   ),
//           // ),
//           // SliverToBoxAdapter(
//           //   child: SizedBox(
//           //     height: 100.0,
//           //     child: ListView.builder(
//           //       scrollDirection: Axis.horizontal,
//           //       itemCount: 5,
//           //       itemBuilder: (context, index) {
//           //         return SizedBox(
//           //           width: 100.0,
//           //           child: Card(
//           //             color: Colors.cyan[100 * (index % 9)],
//           //             child: Text('Item $index'),
//           //           ),
//           //         );
//           //       },
//           //     ),
//           //   ),
//           // ),
//           // SliverFixedExtentList(
//           //   itemExtent: 60.0,
//           //   delegate: SliverChildBuilderDelegate(
//           //     (BuildContext context, int index) {
//           //       return Container(
//           //         alignment: Alignment.center,
//           //         color: Colors.lightBlue[100 * (index % 9)],
//           //         child: Text('List Item $index'),
//           //       );
//           //     },
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
