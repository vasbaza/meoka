import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meoka',
          style: TextStyle(fontSize: 30, fontFamily: "NotoSansJP"),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      // backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _usernameTextController = TextEditingController();

  double _formProgress = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateFormProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedProgressIndicator(value: _formProgress),
          Text(
            'Sign up',
            style: TextStyle(fontSize: 30, fontFamily: "NotoSansJP"),
            // style: Theme
            // .of(context)
            // .textTheme
            // .headline4
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              cursorColor: Colors.black,
              controller: _firstNameTextController,
              decoration: InputDecoration(
                hintText: 'First name',
                hintStyle: TextStyle(fontSize: 17, fontFamily: "NotoSansJP"),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              cursorColor: Colors.black,
              controller: _lastNameTextController,
              decoration: InputDecoration(
                hintText: 'Last name',
                hintStyle: TextStyle(fontSize: 17, fontFamily: "NotoSansJP"),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              cursorColor: Colors.black,
              controller: _usernameTextController,
              decoration: InputDecoration(
                hintText: 'Username',
                hintStyle: TextStyle(fontSize: 17, fontFamily: "NotoSansJP"),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor:
                  MaterialStateColor.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.white70;
              }),
              backgroundColor:
                  MaterialStateColor.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.deepPurple;
              }),
            ),
            onPressed: _formProgress == 1 ? _showWelcomeScreen : null,
            child: Text(
              'Sign up',
              style: TextStyle(fontSize: 14, fontFamily: "NotoSansJP"),
            ),
          ),
          Padding(padding: EdgeInsets.all(2.0))
        ],
      ),
    );
  }

  void _showWelcomeScreen() {
    Navigator.of(context).pushNamed('/firstRoute');
  }

  void _updateFormProgress() {
    var progress = 0.0;
    var controllers = [
      _firstNameTextController,
      _lastNameTextController,
      _usernameTextController
    ];

    for (var controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }
}

class AnimatedProgressIndicator extends StatefulWidget {
  final double value;

  AnimatedProgressIndicator({@required this.value});

  @override
  State<StatefulWidget> createState() {
    return _AnimatedProgressIndicatorState();
  }
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _colorAnimation;
  Animation<double> _curveAnimation;

  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 1200), vsync: this);
    var colorTween = TweenSequence([
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.deepPurple, end: Colors.deepPurple),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.deepPurple, end: Colors.deepPurple),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.deepPurple, end: Colors.deepPurple),
        weight: 1,
      ),
    ]);

    _colorAnimation = _controller.drive(colorTween);
    _curveAnimation = _controller.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.animateTo(widget.value);
  }

  @override
  Widget build(BuildContext contex) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => LinearProgressIndicator(
        value: _curveAnimation.value,
        valueColor: _colorAnimation,
        backgroundColor: _colorAnimation.value.withOpacity(0.4),
      ),
    );
  }
}
