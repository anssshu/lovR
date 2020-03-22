#lovR ------

Its an entity component system and state machine based frame work
on top of the open source love2d frame work

the current project is made with the love2d 11.3

the project structure will be as follows
.
├── README.md
├── art
├── doc
└── game
    ├── asset
    ├── lib
    │   ├── core
    │   └── ext
    └── src


art  ----- the art folder will contain all the graphics and sound files during the development stage.
doc  ----- the doc folder will contain all the documentation related to the project
game ----- the game folder will contain the love2d game itself.

asset ---- this folder will contain all the asset
lib   ---- this folder will contain all the external libraries inside the /ext folder and developed libraries inside the /core dir
src   ---- this folder contains all the source code required for the game development

the external library this project will be using are
anim-8
tiny-ecs
HC
windfield
