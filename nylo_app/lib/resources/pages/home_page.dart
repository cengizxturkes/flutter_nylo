import 'package:flutter_app/app/forms/login_form.dart';

import '/resources/widgets/safearea_widget.dart';
import '/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class HomePage extends NyStatefulWidget<HomeController> {
  static RouteView path = ("/home", (_) => HomePage());

  HomePage({super.key}) : super(child: () => _HomePageState());
}

class _HomePageState extends NyPage<HomePage> {
  int? _stars;

  @override
  get init => () async {
        /// Uncomment the code below to fetch the number of stars for the Nylo repository
        // Map<String, dynamic>? githubResponse = await api<ApiService>(
        //         (request) => request.githubInfo(),
        // );
        // _stars = githubResponse?["stargazers_count"];
      };

  /// Define the Loading style for the page.
  /// Options: LoadingStyle.normal(), LoadingStyle.skeletonizer(), LoadingStyle.none()
  /// uncomment the code below.
  @override
  LoadingStyle get loadingStyle => LoadingStyle.normal();
  LoginForm form = LoginForm();

  /// The [view] method displays your page.
  @override
  Widget view(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showToastSuccess(title: "Hello 👋", description: "Welcome to Nylo");
        },
        child: const Icon(Icons.notifications),
      ),
      body: SafeAreaWidget(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NyForm(
            form: form,
            footer: MaterialButton(
              onPressed: () {
                form.submit(onSuccess: (data) {
                  // Do something with the data
                });
              },
              child: Text("Submit"),
            ),
          ),
        ],
      )),
    );
  }
}
