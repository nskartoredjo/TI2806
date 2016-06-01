% percepts:
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

% knowledge:
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

demolishBuilding(ID) :- demolished(ID).
haveTerrace :- constructed(Id, Name), (Name == terrace; Name = terras).
buildStore :- constructed(ID, Name), (Name =='buurtwinkel'; Name == 'convenience store').
buildSportsCenter :- constructed(ID, Name), (Name =='sportcentrum'; Name == 'sports center').