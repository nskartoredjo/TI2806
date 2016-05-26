% percepts:
:- dynamic stakeholders/1.
:- dynamic settings/1.
:- dynamic functions/1.
:- dynamic buildings/1.
:- dynamic indicator/1.
:- dynamic stakeholder/1.

% knowledge:
:- dynamic demolished/1.
:- dynamic constructed/2.

demolishBuilding(ID) :- demolished(ID).
haveTerrace :- constructed(Id, Name), (Name == terrace; Name = terras).
%haveTerrace :- stakeholder(ID, Name, Budget, Income, Link(ID2, Indicator(ID3, IndicatorName, weight), indicator(ID4, value, target), Name == 'Voorzieningen', IndicatorName='Terras Indicator (2)', ID4==ID3, value>=target.
buildStore :- constructed(ID, Name), (Name =='buurtwinkel'; Name == 'convenience store').
buildSportsCenter :- constructed(ID, Name), (Name =='sportcentrum'; Name == 'sports center').
%buyLand :- 
