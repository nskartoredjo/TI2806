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
:- dynamic indicator/3.
:- dynamic my_stakeholder_id/1.
:- dynamic zone/5.
:- dynamic building/7.

% knowledge:
:- dynamic demolished/1.
:- dynamic constructed/2.

buurtwinkelIndicator(CurrentValue, TargetValue) :- 
	my_stakeholder_id(StakeholderId), 
	indicatorLink(StakeholderId, IndicatorWeights), 
	member(indicatorWeights(IndicatorId, IndicatorName, _), IndicatorWeights), 
	(IndicatorName == 'Buurtwinkel Indicator'; IndicatorName == 'Buurtwinkel Indicator (2)'), 
	indicator(IndicatorId, CurrentValue, TargetValue).
	
terrasIndicator(CurrentValue, TargetValue) :- 
	my_stakeholder_id(StakeholderId), 
	indicatorLink(StakeholderId, IndicatorWeights), 
	member(indicatorWeights(IndicatorId, IndicatorName, _), IndicatorWeights), 
	(IndicatorName == 'Terras Indicator' ; IndicatorName == 'Terras Indicator (2)'), 
	indicator(IndicatorId, CurrentValue, TargetValue).
	
sportcentrumIndicator(CurrentValue, TargetValue) :- 
	my_stakeholder_id(StakeholderId), 
	indicatorLink(StakeholderId, IndicatorWeights), 
	member(indicatorWeights(IndicatorId, IndicatorName, _), IndicatorWeights), 
	(IndicatorName == 'Sportcentrum Indicator'; IndicatorName == 'Sportcentrum Indicator (2)'), 
	indicator(IndicatorId, CurrentValue, TargetValue).

demolishBuilding(ID) :- demolished(ID).
haveTerrace :- constructed(Id, Name), (Name == terrace; Name = terras).
buildStore :- constructed(ID, Name), (Name =='buurtwinkel'; Name == 'convenience store').
buildSportsCenter :- constructed(ID, Name), (Name =='sportcentrum'; Name == 'sports center').