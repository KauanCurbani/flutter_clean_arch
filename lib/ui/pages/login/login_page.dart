import 'package:delivery_flutter/ui/pages/presenters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginPagePresenter presenter = Get.find<LoginPagePresenter>();
    TextEditingController userController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Future<void> login() async {
      presenter.login(userController.text, passwordController.text);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: userController,
                  key: const Key("username"),
                  decoration: const InputDecoration(
                    hintText: "Usuário",
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  key: const Key("password"),
                  decoration: const InputDecoration(
                    hintText: "Senha",
                  ),
                ),
                const SizedBox(height: 12),
                FilledButton(
                  key: const Key("login_button"),
                  onPressed: () {
                    login();
                  },
                  child: Row(
                    children: [
                      Obx(
                        () => presenter.loading.value
                            ? const Text("Entrando...")
                            : const Text("Entrar"),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
