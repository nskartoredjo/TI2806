% percepts:
:- dynamic stakeholders/1.
:- dynamic settings/1.
:- dynamic functions/1.
:- dynamic buildings/1.

% knowledge:
:- dynamic demolished/1.
:- dynamic constructed/2.

demolishBuilding(ID) :- demolished(ID).
haveTerrace :- constructed(Id, Name), (Name == terrace; Name = terras).
buildStore :- constructed(ID, Name), (Name =='buurtwinkel'; Name == 'convenience store').
buildSportsCenter :- constructed(ID, Name), (Name =='sportcentrum'; Name == 'sports center').
