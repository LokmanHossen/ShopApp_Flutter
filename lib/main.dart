import 'package:flutter/material.dart';
import 'package:shop_app/screen/product_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      home: ProductOverviewScreen(),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Shop App'),
//       ),
//       body: const Center(
//         child: Text('shoppppppppppppppppppppppppppppp'),
//       ),
//     );
//   }
// }
