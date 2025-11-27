# Game_USR

## Estructura de las carpetas
|-- Assets/
|	|-- Audio/
|	|-- Characters/
|	|-- Environments/
|	|-- Minigames/
|	|-- Props/
|	|-- Ui/
|	|	|-- Images/
|	|	|-- Menus/

|-- Scenes/
|	|-- Characters/
|	|-- Cinematics/
|	|-- Environments/
|	|-- Gameplay/
|	|-- Ui/
|	|	|-- Menus/

|-- Scripts/
|	|-- Characters/
|	|-- Systems/
|	|-- Ui/

|-- Sandbox/
|	|-- Test_assets/
|	|-- Test_scenes/

|-- Tests/
|	|-- characters/
			test_character_movement.tscn
|	|-- Systems/
			test_inventory.tscn
			test_scene_transition.tscn
|	|-- Ui/
			test_dialogue_ui.tscn
|	|-- Minigames/
			test_laundry_mechanic.tscn


### Info específica de la estructura
- Ui: hace referencia a menús, user interface, botones, HUD, etc
- Scenes/Gameplay: scenes como Minijuegos, etc
- Scenes/Environments: los escenarios jugables (en nuestro caso también podríamos llamarlo Environments)
- Scenes/Cinematics: para guardar las cinemáticas "independientes" (algunas cinemáticas concretas pueden ir atadas a scenes concretas)
- Assets/Props: elementos interactuables (objetos, etc)
- Scripts/Systems: para gestión de inventario, cargado de escenas, gestión de variables, gestión de diálogos, guardado/cargado...
- Shaders: shaders 2D simples como brillos, highlight al pasar el ratón...
- Data: Diálogos en JSON, configuración de minijuegos, traducciones, información de objetos (como descripciones)
- Autoload: son scripts de sistemas pero enfocados a aquellos que sean Managers, siempre accesibles, no se destruyen nunca (hasta que se cierre
el programa) y son accesibles desde cualquier script (son globales, como singletones). Ej: GameState.gd, SceneManager.gd, AudioManager.gd, 
DialogueManager.gd, Inventory.gd, SceneController.gd, NarrativeManager.gd, GlobalState.gd
- Sandbox: carpeta donde guardar assets y scenes de prototipado y/o prueba. Por ejemplo, para testear mecánicas y demás
- Tests: son escenas de prueba para poder testear los diferentes elementos del videojuego de forma aislada. NO son lo mismo que las pruebas
de sandbox (donde suelen existir más al principio del desarrollo). Los tests son importantes de conservar, actualizar e ir creando más según
necesidad y sistemas desarrollados


### NOTAS Y DUDAS
- Crear MenúManager.gd? Se pondría en carpeta Autoload y serviría para la navegación entre menús.
- GameState.gd: Para flags de decisiones, objetos recogidos, minijuegos activos / inactivos (?), ...
