import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
              onChanged: loginProvider.setEmail,
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
              onChanged: loginProvider.setPassword,
            ),
            SizedBox(height: 16),
            loginProvider.isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      try {
                        await loginProvider.login();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Login Successful!"),
                          backgroundColor: Colors.green,
                        ));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(e.toString()),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                    child: Text("Login"),
                  ),
          ],
        ),
      ),
    );
  }
}
