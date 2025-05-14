import 'package:flutter/material.dart';
import 'package:tads23_student/common/config/dependencies.dart';
import 'package:tads23_student/ui/controllers/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late HomePageController viewController;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isEditing = false;

  @override
  void InitState() {
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
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.9,
      ).animate(CurvedAnimation(
        parent: _animationController,
        curve:));
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
      if(_isEditing) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cartão de Estudante',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
            tooltip: 'Edit Information',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
            tooltip: 'Reset Information',
          ),
        ],
      ),
      body: Stack(
        children:<Widget>[
          //constrói um circulo à topo-direita
          Positioned(
            top: -80,
            right: -70,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            top: -70,
            right: -80,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ]
      )
    );
  }
}
