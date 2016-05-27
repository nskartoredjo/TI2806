% percepts:
:- dynamic stakeholders/1.
:- dynamic settings/1.
:- dynamic functions/1.
:- dynamic buildings/1.
:- dynamic indicators/1.
:- dynamic stakeholders/1.

% knowledge:
:- dynamic demolished/1.
:- dynamic constructed/2.

demolishBuilding(ID) :- demolished(ID).
%haveTerrace :- constructed(Id, Name), (Name == terrace; Name = terras). OLD


%These should work however tygrons indicators still don't work so we can not test these. appart from there may be an error if multiple stakeholders make use of the same indicator since this changes the indicator names.
buildStore :- stakeholders(L), member((stakeholder(ID, Name, Budget, Income), indictorLink(ID, IndicatorL)), L), member(indicatorWeights(IndID, IndName,Weight), IndicatorL), IndName == 'Buurtwinkel Indicator', Name == 'Voorzieningen', indicators(Indicators), member(indicator(IndID, Value, Target),Indicators), Value >= Target.
buildSportsCenter :- stakeholders(L), member((stakeholder(ID, Name, Budget, Income), indictorLink(ID, IndicatorL)), L), member(indicatorWeights(IndID, IndName,Weight), IndicatorL), IndName == 'Sportcentrum Indicator', Name == 'Voorzieningen', indicators(Indicators), member(indicator(IndID, Value, Target),Indicators), Value >= Target.
haveTerrace :- stakeholders(L), member((stakeholder(ID, Name, Budget, Income), indictorLink(ID, IndicatorL)), L), member(indicatorWeights(IndID, IndName,Weight), IndicatorL), IndName == 'Terras Indicator', Name == 'Voorzieningen', indicators(Indicators), member(indicator(IndID, Value, Target),Indicators), Value >= Target.
%buyLand :- 
