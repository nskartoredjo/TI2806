%%% percepts %%%
:- dynamic actions/1.
:- dynamic action_logs/1.

% building(BuildingId, BuildingName, OwnerId, ConstructionYear, Categories, FunctionId, Floors) are stored in a list in buildings(BuildingsList).
:- dynamic building/7.
:- dynamic buildings/1.

:- dynamic functions/1.

% indicator(IndicatorId, CurrentValue, TargetValue) are stored in a list in indicators(IndicatorsList).
% indicatorLink(StakeholderId, indicatorWeights(IndicatorId, IndicatorName, Weight)) links a stakeholder to its indicators.
:- dynamic indicator/3.
:- dynamic indicatorLink/2.
:- dynamic indicators/1.

:- dynamic lands/1.

% my_stakeholder_id(StakeholderId) contains the Stakeholder ID of the stakeholder occupied by the agent.
:- dynamic my_stakeholder_id/1.

:- dynamic requests/1.
:- dynamic settings/1.

% stakeholder(StakeholderId, Name, OldIncome, StartBudget) are stored individually.
:- dynamic stakeholder/4.
:- dynamic stakeholders/1.

% zone(ZoneId, ZoneName, MaxFloors, Size, Allowed_Categories) are stored individually.
:- dynamic zone/5.
:- dynamic zones/1.

%%% knowledge %%%
:- dynamic demolished/1.
:- dynamic constructed/2.

buurtwinkelIndicator(CurrentValue, TargetValue) :- 
	my_stakeholder_id(StakeholderId), 
	indicatorLink(StakeholderId, IndicatorWeights), 
	member(indicatorWeights(IndicatorId, IndicatorName, _), IndicatorWeights), 
	(IndicatorName == 'Buurtwinkel Indicator'; IndicatorName == 'Buurtwinkel Indicator (2)'), 
	indicators(IndicatorList),
	member(indicator(IndicatorId, CurrentValue, TargetValue), IndicatorList).
	
terrasIndicator(CurrentValue, TargetValue) :- 
	my_stakeholder_id(StakeholderId), 
	indicatorLink(StakeholderId, IndicatorWeights), 
	member(indicatorWeights(IndicatorId, IndicatorName, _), IndicatorWeights), 
	(IndicatorName == 'Terras Indicator' ; IndicatorName == 'Terras Indicator (2)'), 
	indicators(IndicatorList),
	member(indicator(IndicatorId, CurrentValue, TargetValue), IndicatorList).
	
sportcentrumIndicator(CurrentValue, TargetValue) :- 
	my_stakeholder_id(StakeholderId), 
	indicatorLink(StakeholderId, IndicatorWeights), 
	member(indicatorWeights(IndicatorId, IndicatorName, _), IndicatorWeights), 
	(IndicatorName == 'Sportcentrum Indicator'; IndicatorName == 'Sportcentrum Indicator (2)'), 
	indicators(IndicatorList),
	member(indicator(IndicatorId, CurrentValue, TargetValue), IndicatorList).

% description:
% - demolish building will be automaticly comleted after demolished is done.
demolishBuilding(ID) :- 
	demolished(ID).

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
% - Tygrons indicators still don't work so we can not test these. apart from there may be an error if multiple stakeholders make use of the same indicator since this changes the indicator names.
