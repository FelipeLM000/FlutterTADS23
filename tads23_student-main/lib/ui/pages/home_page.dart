import 'package:flutter/material.dart';
import 'package:tads23_student/common/config/dependencies.dart';
import 'package:tads23_student/ui/controllers/home_page_controller.dart';
import 'package:tads23_student/ui/widgets/card_tads_student_widget.dart';
import 'package:tads23_student/ui/widgets/editing_student_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late HomePageController viewController;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    viewController = injector.get<HomePageController>();
    viewController.load.execute();

    // setup de animações
    // cria um controlador com um ciclo de renderização
    // a animação durará 300 milissegundos
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // cria uma animação com efeito de zoom in/out
    // _animationController.forward(); Encolhe o card
    // _animationController.reverse(); volta ao normal
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // ignore: unused_element
  void _toggleEditMode() {
    setState(() {
      _isEditing = !_isEditing;
      if (_isEditing) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cartão de Estudante',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            //icon: const Icon(Icons.edit),
            icon: Icon(
              _isEditing ? Icons.close : Icons.edit,
              color: Colors.white,
            ),
            onPressed: _toggleEditMode,
            tooltip: _isEditing ? 'Cancelar' : 'Editar informações',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
            tooltip: 'Reset Information',
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          //constrói um circulo à topo-direita
          Positioned(
            top: -80,
            right: -70,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            bottom: -70,
            left: -80,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SafeArea(
            if(_isEditing)
            Positioned.fill(
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Container(
                      color: Colors.black.withOpacity(0.3 * value),
                      child: SingleChildScrollView(
                        child: ,
                      )
                    )
                  )
                }
              )
            )),
        ],
      ),
    );
  }
}
