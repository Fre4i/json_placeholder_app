import 'package:flutter/material.dart';

// StatefulWidget имеет состояние,с которым
// позже мы будем работать через функцию
// setState(VoidCallback fn)
// обратите внимание setState принимает другую функцию
class HomePage extends StatefulWidget {
  // StatefulWidget должен возращать класс,
  // которые наследуются от State
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // _count - приватная переменная
  var _count = 0;

  // функция build, как мы уже отметили, строит
  // иерархию наших любимых виджетов
  @override
  Widget build(BuildContext context) {
    // в большинстве случаев Scaffold используется,
    // как корневой виджет для страницы или экрана
    // Scaffold позволяет вам указать AppBar, BottomNavigationBar,
    // Drawer, FloatingActionButton и другие не менее важные
    // компоненты (виджеты)
    return Scaffold(
      // мы создаем AppBar с текстом "Home Page"
      appBar: AppBar(title: Text("Home page")),
      // указываем текст в качестве тела Scaffold
      // текст предварительно вложен в Center виджет,
      // чтобы выровнять его по центру
      body: Center(
        child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 900),
            reverseDuration: const Duration(milliseconds: 0),
            child: Text(
              "$_count",
              // здесь самое интересное
              // когда мы изменяем значение _counter
              // и вызываем функцию setState, компоненты
              // перерисовываются и AnimatedSwitcher сравнивает
              // предыдущий key своего дочернего виджета с текущим,
              // если они не совпадают, то вопроизводит анимацию
              key: ValueKey<int>(_count),
              // Также выравнениваем текст внутри самого виджета Text
              textAlign: TextAlign.center,
              // Theme.of(context) позволяет получить доступ к
              // текущему ThemeData, который был указан в MaterialApp
              // После получения ThemeData мы можем использовать
              // различные его стили (например headline3, как здесь)
              style: Theme.of(context).textTheme.headline3,
            )
        ),
      ),
      //Добавляем кнопку
      floatingActionButton: FloatingActionButton(
        // указываем иконку
        child: Icon(Icons.animation),
        onPressed: () {
          setState(() {
            _count++;
          });
        },
      ),
    );
    throw UnimplementedError();
  }

}