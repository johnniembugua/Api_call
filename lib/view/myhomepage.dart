import 'package:api_call2/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controller = Get.put(UserController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('List of Users'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Expanded(
            child: Obx(
              () {
                return controller.postLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Center(
                        child: ListView.builder(
                            itemCount: controller.getUsers.length < 5
                                ? controller.getUsers.length
                                : 5,
                            itemBuilder: (context, index) {
                              var user = controller.getUsers[index];
                              return Center(
                                  child: Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        user.name,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )));
                              // Card(
                              //   child: ListTile(
                              //     title: Text(user.name),
                              //     leading: Text(user.id.toString()),
                              //   ),
                              //);
                            }),
                      );
              },
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
