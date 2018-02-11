// pseudo oNode create event FOUND IN oGAME STEP
neighbors = ds_list_create();

color = c_white

occupant = noone;
passable = true;

//location
gridX = 0;
gridY = 0;

//type of node, cost of movement (energy?)
type = "node";


//pathfinding variables ===================================================
parent = noone;
G = 0; //how far away this node is from the source node (where our actor is standing)

moveNode = false;
attackNode = false;

cost = 1;

