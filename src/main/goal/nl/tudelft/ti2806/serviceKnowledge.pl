:- dynamic stakeholders/1.
:- dynamic settings/1.
:- dynamic functions/1.
:- dynamic buildings/1.
:- dynamic demolished/1.
:- dynamic constructed/1.

% we have a building if the building list has at least 1 element.
havebuilding :- buildings([X|Y]).

demolishBuilding(ID) :- demolished(ID).

buildStore :- constructed(365).