import 'package:flutter/material.dart';
import 'package:socmedclone/socmed.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String errormessage;
  late bool isError;



  @override
  void initState() {
    super.initState();
    errormessage = 'This is an error message';
    isError = false;
  }

  @override

  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void checkLogin(username,password){
    setState(() {
      if(username == 'admin' && password == 'admin'){
        isError = false;
      }else{
        isError = true;
        errormessage = 'Invalid username or password';
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center (
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Image.asset(
                'assets/logo.png',
                width: 100,
                height: 100,
                ),
                const SizedBox(width: 10),
                Text('Rojenne Paul Caras', style: txtstlye2),
            ],
            ),
            SizedBox(height: 15),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Enter Username',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Enter Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.password),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.blueAccent,
              ),
              onPressed: () {
                checkLogin(usernameController.text, passwordController.text);
                if (!isError) {
                  // Navigate to the next screen or perform any other action
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SocMed()),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login successful!')),
                  );
                }
                
              },
              child: Text('LOGIN', style: txtstlye2),
            ),
            SizedBox(height: 15),
            ],

          ),
        ),
      ),
    );
  } 
}


var txtstlye = const TextStyle(
  fontSize: 14,
  letterSpacing: 2,
  fontWeight: FontWeight.bold,
);

var registertxtstlye = const TextStyle(
  fontSize: 14,
  letterSpacing: 2,
  fontWeight: FontWeight.bold,
);

var errortxtstlye = const TextStyle(
  fontSize: 14,
  letterSpacing: 2,
  fontWeight: FontWeight.bold,
  color: Colors.red,
);

var txtstlye2 = const TextStyle(
  fontSize: 24,
  letterSpacing: 2,
  fontWeight: FontWeight.bold,
  color: Colors.black, 
);

