import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

/// Presentation Page: UI 화면
/// - 사용자 입력을 받아서 Event를 발생시킴
/// - BLoC의 State를 구독하여 UI를 업데이트
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();
    final phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('회원가입')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('회원가입 성공: ${state.user.name}')),
            );
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('에러: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: '이메일'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: '비밀번호'),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: '이름'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: '전화번호 (선택)'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: state is AuthLoading
                      ? null
                      : () {
                          context.read<AuthBloc>().add(
                                SignUpRequested(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                  phone: phoneController.text.isEmpty
                                      ? null
                                      : phoneController.text,
                                ),
                              );
                        },
                  child: state is AuthLoading
                      ? const CircularProgressIndicator()
                      : const Text('회원가입'),
                ),
                if (state is AuthSuccess) ...[
                  const SizedBox(height: 20),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '저장된 사용자 정보:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text('ID: ${state.user.id}'),
                          Text('이메일: ${state.user.email}'),
                          Text('이름: ${state.user.name}'),
                          if (state.user.phone != null)
                            Text('전화번호: ${state.user.phone}'),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

