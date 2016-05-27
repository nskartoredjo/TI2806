% percepts:
:- dynamic stakeholders/1.
:- dynamic settings/1.
:- dynamic functions/1.
:- dynamic buildings/1.
:- dynamic action_logs/1.
:- dynamic actions/1.
:- dynamic lands/1.
:- dynamic requests/1.
:- dynamic zones/1.
:- dynamic stakeholder/4.
:- dynamic indicatorLink/2.

% knowledge:
:- dynamic demolished/1.
:- dynamic constructed/2.

demolishBuilding(ID) :- demolished(ID).
haveTerrace :- constructed(Id, Name), (Name == terrace; Name = terras).
buildStore :- constructed(ID, Name), (Name =='buurtwinkel'; Name == 'convenience store').
buildSportsCenter :- constructed(ID, Name), (Name =='sportcentrum'; Name == 'sports center').