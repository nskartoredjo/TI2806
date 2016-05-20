% percepts:
:- dynamic stakeholders/1.
:- dynamic settings/1.
:- dynamic functions/1.
:- dynamic buildings/1.
:- dynamic constructed/2.

% knowledge:
haveTerrace :- constructed(Id, Name), (Name == terrace; Name = terras).