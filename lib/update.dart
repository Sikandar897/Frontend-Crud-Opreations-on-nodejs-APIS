import 'package:app_with_node/model/product_model.dart';
import 'package:app_with_node/services/api.dart';
import 'package:flutter/material.dart';

import 'edit_screen.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Screen'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder(
          future: Api.getProduct(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              List<ProductModel> pdata = snapshot.data;
              return ListView.builder(
                  itemCount: pdata.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: const Icon(Icons.storage),
                      title: Text("${pdata[index].name}"),
                      subtitle: Text("${pdata[index].description}"),
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditScreen(
                                    data: pdata[index],
                                  ),
                                ));
                          },
                          icon: Icon(Icons.edit)),
                    );
                  });
            }
          }),
    );
  }
}
