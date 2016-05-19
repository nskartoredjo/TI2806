% percepts:
:- dynamic stakeholders/1.
:- dynamic settings/1.
:- dynamic functions/1.
:- dynamic buildings/1.

% internal percepts:
:- dynamic occupied/1.

% knowledge:
havebuilding :- buildings([X]).