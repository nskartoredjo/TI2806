%%% percepts %%%
:- dynamic stakeholders/1.
:- dynamic settings/1.
:- dynamic functions/1.
:- dynamic buildings/1.
:- dynamic indicators/1.
:- dynamic stakeholders/1.

%%% knowledge %%%
:- dynamic demolished/1.
:- dynamic constructed/2.

% description:
% - TODO
demolishBuilding(ID) :- 
	demolished(ID).

% description: 
% - TODO
buildStore :- 
	stakeholders(L), 
	member((stakeholder(ID, Name, Budget, Income), 
	indictorLink(ID, IndicatorL)), L), 
	member(indicatorWeights(IndID, IndName,Weight), IndicatorL), 
	IndName == 'Buurtwinkel Indicator', 
	Name == 'Voorzieningen', 
	indicators(Indicators), 
	member(indicator(IndID, Value, Target),Indicators), 
	Value >= Target.

% description:
% - TODO
buildSportsCenter :- 
	stakeholders(L), 
	member((stakeholder(ID, Name, Budget, Income), 
	indictorLink(ID, IndicatorL)), L), 
	member(indicatorWeights(IndID, IndName,Weight), IndicatorL), 
	IndName == 'Sportcentrum Indicator', 
	Name == 'Voorzieningen', indicators(Indicators), 
	member(indicator(IndID, Value, Target),Indicators), 
	Value >= Target.

% description:
% - TODO	
buildTerrace :- 
	stakeholders(L), 
	member((stakeholder(ID, Name, Budget, Income), 
	indictorLink(ID, IndicatorL)), L), 
	member(indicatorWeights(IndID, IndName,Weight), IndicatorL), 
	IndName == 'Terras Indicator', 
	Name == 'Voorzieningen', 
	indicators(Indicators), 
	member(indicator(IndID, Value, Target),Indicators), 
	Value >= Target.

%%% NOTES %%% 
% - Tygrons indicators still don't work so we can not test these. appart from there may be an error if multiple stakeholders make use of the same indicator since this changes the indicator names.
