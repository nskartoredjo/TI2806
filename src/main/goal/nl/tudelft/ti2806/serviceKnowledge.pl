%%% percepts %%%
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
:- dynamic indicators/1.
:- dynamic stakeholders/1.

%%% knowledge %%%
:- dynamic demolished/1.
:- dynamic bought/0.
:- dynamic constructed/2.

% description:
% - demolish building will be automaticly comleted after demolished is done.
demolishBuilding(ID) :- 
	demolished(ID).
	
buyLand :-
	bought.

% description: 
% The buildStore goal will be completed when the value of the indicator is larger or equal to target of the indicator.
% For this we first need to get the right indicator from the right stakeholder, by using the beliefs of those.
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
% The buildSportsCenter goal will be completed when the value of the indicator is larger or equal to target of the indicator.
% For this we first need to get the right indicator from the right stakeholder, by using the beliefs of those.
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
% The buildTerrace goal will be completed when the value of the indicator is larger or equal to target of the indicator.
% For this we first need to get the right indicator from the right stakeholder, by using the beliefs of those.	
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
