:- dynamic stakeholders/1.
:- dynamic settings/1.
:- dynamic functions/1.
:- dynamic buildings/1.
:- dynamic demolished/1.
:- dynamic constructed/2.

demolishBuilding(ID) :- demolished(ID).
buildStore :- constructed(ID, Name), (Name =='buurtwinkel'; Name == 'convenience store').
buildSportsCenter :- constructed(ID, Name), (Name =='sportcentrum'; Name == 'sports center').