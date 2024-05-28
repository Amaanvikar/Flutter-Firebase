// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:modernlogintute/components/my_button.dart';
// import 'package:modernlogintute/components/my_textfield.dart';
// import 'package:modernlogintute/components/square_tile.dart';

// import 'home_page.dart';

// class RegisterPage extends StatefulWidget {
//   final Function()? onTap;

//   const RegisterPage({super.key, required this.onTap});

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   // text editing controllers
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();

//   bool isLoading = false;
//   // sign user in method
//   void signUserUp() async {
//     try {
//       if (passwordController.text == confirmPasswordController.text) {
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );
//         else (passwordController.text) != (confirmaPasswordController.text) {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text("Please Fill all the Fields"),
//             backgroundColor: Colors.red,
//           ));
//         return;
//       }
//       setState(() {
//         isLoading = true;
//       });

//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );

//       setState(() {
//         isLoading = false;
//       });

//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("Login Successfull"),
//         backgroundColor: Colors.green,
//       ));

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomePage()),
//       );

//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("Error: $e"),
//         backgroundColor: Colors.red,
//       ));

//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       body: SafeArea(
//         child: Center(
//           child: (isLoading)
//               ? CircularProgressIndicator()
//               : SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const SizedBox(height: 25),

//                       // logo
//                       const Icon(
//                         Icons.lock,
//                         size: 50,
//                       ),

//                       const SizedBox(height: 25),

//                       // welcome back, you've been missed!
//                       Text(
//                         'Let\'s create an account for you!',
//                         style: TextStyle(
//                           color: Colors.grey[700],
//                           fontSize: 16,
//                         ),
//                       ),

//                       const SizedBox(height: 25),

//                       // username textfield
//                       MyTextField(
//                         controller: emailController,
//                         hintText: 'Email',
//                         obscureText: false,
//                       ),

//                       const SizedBox(height: 10),

//                       // password textfield
//                       MyTextField(
//                         controller: passwordController,
//                         hintText: 'Password',
//                         obscureText: true,
//                       ),

//                       const SizedBox(height: 10),

//                       // password textfield
//                       MyTextField(
//                         controller: confirmPasswordController,
//                         hintText: 'Confirm Password',
//                         obscureText: true,
//                       ),

//                       // forgot password?
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Text(
//                               'Forgot Password?',
//                               style: TextStyle(color: Colors.grey[600]),
//                             ),
//                           ],
//                         ),
//                       ),

//                       const SizedBox(height: 25),

//                       // sign in button
//                       MyButton(
//                         text: "Sign Up",
//                         onTap: signUserUp,
//                       ),

//                       const SizedBox(height: 50),

//                       // or continue with
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: Divider(
//                                 thickness: 0.5,
//                                 color: Colors.grey[400],
//                               ),
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10.0),
//                               child: Text(
//                                 'Or continue with',
//                                 style: TextStyle(color: Colors.grey[700]),
//                               ),
//                             ),
//                             Expanded(
//                               child: Divider(
//                                 thickness: 0.5,
//                                 color: Colors.grey[400],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),

//                       const SizedBox(height: 50),

//                       // google + apple sign in buttons
//                       const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           // google button
//                           SquareTile(imagePath: 'lib/images/google.png'),

//                           SizedBox(width: 25),

//                           // apple button
//                           SquareTile(imagePath: 'lib/images/apple.png')
//                         ],
//                       ),

//                       const SizedBox(height: 50),

//                       // not a member? register now
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Already have an account',
//                             style: TextStyle(color: Colors.grey[700]),
//                           ),
//                           const SizedBox(width: 4),
//                           GestureDetector(
//                             onTap: widget.onTap,
//                             child: const Text(
//                               'login now',
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 50),
//                     ],
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/square_tile.dart';
import 'package:modernlogintute/services/auth_services.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isLoading = false;

  // sign user up method
  void signUserUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Passwords do not match"),
        backgroundColor: Colors.red,
      ));
      return;
    }

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please fill all the fields"),
        backgroundColor: Colors.red,
      ));
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Registration Successful"),
        backgroundColor: Colors.green,
      ));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: ${e.toString()}"),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 25),

                      // logo
                      const Icon(
                        Icons.lock,
                        size: 50,
                      ),

                      const SizedBox(height: 25),

                      // welcome message
                      Text(
                        'Let\'s create an account for you!',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 25),

                      // email textfield
                      MyTextField(
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      // password textfield
                      MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),

                      const SizedBox(height: 10),

                      // confirm password textfield
                      MyTextField(
                        controller: confirmPasswordController,
                        hintText: 'Confirm Password',
                        obscureText: true,
                      ),

                      const SizedBox(height: 25),

                      // sign up button
                      MyButton(
                        text: "Sign Up",
                        onTap: signUserUp,
                      ),

                      const SizedBox(height: 50),

                      // or continue with
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'Or continue with',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 50),

                      // google + apple sign in buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // google button
                          SquareTile(
                              onTap: () => AuthService().SignInWithGoogle(),
                              imagePath: 'lib/images/google.png'),

                          SizedBox(width: 25),

                          // apple button
                          SquareTile(
                              onTap: () {}, imagePath: 'lib/images/apple.png')
                        ],
                      ),

                      const SizedBox(height: 50),

                      // already have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: const Text(
                              'login now',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
