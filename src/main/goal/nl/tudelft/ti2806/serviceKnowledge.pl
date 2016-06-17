%%% percepts %%%
:- dynamic actions/1.
:- dynamic action_logs/1.

% building(BuildingId, BuildingName, OwnerId, ConstructionYear, Categories, FunctionId, Floors) are stored in a list in buildings(BuildingsList).
:- dynamic building/7.
:- dynamic buildings/1.

:- dynamic functions/1.

% indicator(IndicatorId, CurrentValue, TargetValue) are stored in a list in indicators(IndicatorsList).
% indicatorLink(StakeholderId, indicatorWeights(IndicatorId, IndicatorName, Weight)) links a stakeholder to its indicators.
:- dynamic indicator/4.
:- dynamic zoneLink/4.
:- dynamic indicatorLink/2.
:- dynamic indicators/1.
:- dynamic indicatorWeights/3.

:- dynamic lands/1.

% my_stakeholder_id(StakeholderId) contains the Stakeholder ID of the stakeholder occupied by the agent.
:- dynamic my_stakeholder_id/1.

% request(TypeName, Type, PopupId, PopupContentLinkId, VisibleForStakeholders, ActionLogId, Price, MultiPolygon, Area, Answers) 
% are stored in a list in requests(RequestList).
:- dynamic requests/1.
:- dynamic request/10.

:- dynamic settings/1.

% stakeholder(StakeholderId, Name, OldIncome, StartBudget) are stored individually.
:- dynamic stakeholder/4.
:- dynamic stakeholders/1.

 % request(TypeName, Type, PopupId, PopupContentLinkId, VisibleForStakeholders, ActionLogId, Price, MultiPolygon, Area, Answers) 
 % are stored in a list in requests(RequestList).
 :- dynamic requests/1.
 :- dynamic request/10.


% zone(ZoneId, ZoneName, MaxFloors, Size, Allowed_Categories) are stored individually.
:- dynamic zone/5.
:- dynamic zones/1.

%%% knowledge %%%
:- dynamic demolished/1.
:- dynamic bought/0.
:- dynamic constructed/2.
:- dynamic multipolygon/1.


% description:
% The indicator for our convenience store/buurtwinkel is stored in here.
% my_stakeholder_id gives our Stakeholder ID with which we can get our indicator through the indicatorLink.
% Then the correct indicator is found by matching the IndicatorName.
buurtwinkelIndicator(CurrentValue, TargetValue) :- 
	indicatorLink(_, IndicatorWeights), 
	member(indicatorWeights(IndicatorId, IndicatorName, _), IndicatorWeights), 
	(IndicatorName == 'Buurtwinkel Indicator'; IndicatorName == 'Buurtwinkel Indicator (2)'), 
	indicator(IndicatorId, CurrentValue, TargetValue, _).

% description:
% The indicator for our sports center/sportcentrum is stored in here.
% my_stakeholder_id gives our Stakeholder ID with which we can get our indicator through the indicatorLink.
% Then the correct indicator is found by matching the IndicatorName.
sportcentrumIndicator(CurrentValue, TargetValue) :- 
	indicatorLink(_, IndicatorWeights), 
	member(indicatorWeights(IndicatorId, IndicatorName, _), IndicatorWeights), 
	(IndicatorName == 'Sportcentrum Indicator'; IndicatorName == 'Sportcentrum Indicator (2)'), 
	indicator(IndicatorId, CurrentValue, TargetValue, _).

% description:
% The indicator for our terrace/terras is stored in here.
% my_stakeholder_id gives our Stakeholder ID with which we can get our indicator through the indicatorLink.
% Then the correct indicator is found by matching the IndicatorName.
terrasIndicator(CurrentValue, TargetValue) :- 
	indicatorLink(_, IndicatorWeights), 
	member(indicatorWeights(IndicatorId, IndicatorName, _), IndicatorWeights), 
	(IndicatorName == 'Terras Indicator' ; IndicatorName == 'Terras Indicator (2)'), 
	indicator(IndicatorId, CurrentValue, TargetValue, _).

% description:
% - demolish building will be automatically completed after demolished is done.
demolishBuilding(ID) :- 
	demolished(ID).
	
buyLand :-
	bought.

% description: 
% The buildStore goal will be completed when the value of the indicator is larger or equal to target of the indicator.
% For this we first need to get the right indicator from the right stakeholder, by using the beliefs of those.
buildStore :- 
	buurtwinkelIndicator(Value, Target), 
	Value >= 0.60.

% description:
% The buildSportsCenter goal will be completed when the value of the indicator is larger or equal to target of the indicator.
% For this we first need to get the right indicator from the right stakeholder, by using the beliefs of those.
buildSportsCenter :- 
	sportcentrumIndicator(Value, Target), 
	Value >= 0.60.

% description:
% The buildTerrace goal will be completed when the value of the indicator is larger or equal to target of the indicator.
% For this we first need to get the right indicator from the right stakeholder, by using the beliefs of those.	
buildTerrace :- 
	terrasIndicator(Value, Target), 
	Value >= 0.60.



maxTodo([zone_link(ZoneID,_, Current, Target)],(Target -Current), ZoneID).
maxTodo([zone_link(ZoneID,_, Current, Target)|Xs], R, ZoneID3) :- 
        	 maxTodo(Xs, Todo, ZoneID2), 
    ((Target -Current) > Todo -> 
    R = (Target-Current), ZoneID3 = ZoneID ; 
    R = Todo, ZoneID3 = ZoneID2).
%%% NOTES %%% 
% - Tygrons indicators still don't work so we can not test these. apart from there may be an error if multiple stakeholders make use of the same indicator since this changes the indicator names.
