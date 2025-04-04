import 'package:dunu_app_2b_may/screen/forget_password_screen.dart';
import 'package:dunu_app_2b_may/screen/login/verification_page.dart';
import 'package:dunu_app_2b_may/screen/sign_upscrren.dart';
import 'package:dunu_app_2b_may/screen/verification_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dunu_app_2b_may/common/color_extension.dart';
import 'package:dunu_app_2b_may/common_widget/round_button.dart';
import 'package:dunu_app_2b_may/common_widget/round_text_field.dart';
// ignore: unused_import
import 'package:dunu_app_2b_may/screen/login/sign_up_screen.dart';
import 'package:dunu_app_2b_may/pages/home_page.dart';
import 'package:dunu_app_2b_may/screen/login/forget_password_screen.dart';

// librerias de autentificacion
import 'package:firebase_core/firebase_core.dart';
// ignore: duplicate_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:dunu_app_2b_may/screen/login/login_screen.dart';

// Inicio - sesión por correo y contraseña
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dunu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
// fin - sesión por correo y contraseña

// Cuerpo de inicio de sesión
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// Inicio - Inicio sesión correo
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signInWithEmailPassword() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Comprobar si el correo está verificado
      User? user = userCredential.user;
      if (user != null && !user.emailVerified) {
        // Si el correo no está verificado, enviamos el correo de verificación
        await user.sendEmailVerification();

        // Mostrar un mensaje que indica que se envió el correo de verificación
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Correo de verificación enviado. Por favor revisa tu bandeja de entrada.",
          ),
        ));

        // Redirigir al usuario a una página que indique que debe verificar su correo
        context.push(VerificationPage());
      } else {
        // Si el correo está verificado, redirigir al usuario a la página principal
        context.push(const HomePage());
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Error desconocido";
      if (e.code == 'user-not-found') {
        errorMessage = "Usuario no encontrado.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Contraseña incorrecta.";
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
    }
  }
// Final - Inicio sesión correo

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Imagen decorativa principal
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    "lib/icons/icons/burger-1.png",
                    width: double.maxFinite, // Maximo de su contenedor padre
                    fit: BoxFit.fitWidth, // Maximo de su contenedor padre
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                context.pop(); // Regresar al pag anterior
                              },
                              child: Image.asset(
                                "lib/icons/icons/back.png",
                                width: 55,
                                height: 55,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "Bienvenido de regreso",
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 25),
                      // Btn-Facebook
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: MaterialButton(
                          onPressed: () {},
                          minWidth: double.maxFinite,
                          elevation: 0,
                          color: const Color(0xfffe6dcb),
                          height: 60,
                          shape: RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 15),
                              Image.asset(
                                'lib/icons/icons/fb.png',
                                width: 25,
                                height: 25,
                              ),
                              const Expanded(
                                child: Text(
                                  "Continuar con facebook",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 40),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      // Btn- Google
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: MaterialButton(
                          onPressed: () {},
                          minWidth: double.maxFinite,
                          elevation: 0,
                          color: Colors.white,
                          height: 60,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: TColor.tertiary, width: 1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 15),
                              Image.asset(
                                'lib/icons/icons/google.png',
                                width: 25,
                                height: 25,
                              ),
                              Expanded(
                                child: Text(
                                  "Continuar con Google",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 40),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Text(
                "O inicia sesión con tu correo electrónico",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 35),
              RoundTextField(
                hintText: "Correo electrónico",
                controller: _emailController,
              ),
              const SizedBox(height: 20),
              RoundTextField(
                hintText: "Contraseña",
                obscureText: true,
                controller: _passwordController,
              ),
              // BTN-Registrarme morado
              RoundButton(
                title: "Iniciar Sesión",
                onPressed: _signInWithEmailPassword,
              ),
              // Texto de Iniciar sesión, dos colores 2 elementos
              TextButton(
                onPressed: () {
                  context.push(const ForgetPasswordScreen());
                },
                child: Text(
                  "¿Olvidaste tu contraseña?",
                  style: TextStyle(
                    color: TColor.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Crear nueva cuenta",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(const SignUpScreen());
                    },
                    child: Text(
                      "Registrate",
                      style: TextStyle(
                        color: TColor.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
