﻿% for turbo-prolog
:- op('--', xfy, 500).
% for swi-prolog
:- op(500, xfy,'--').

version(102).
tts :- version(X), X > 99.
voice :- version(X), X < 99.

language('sw').
% fest_language(' ').

% IMPLEMENTED (X) or MISSING ( ) FEATURES:
% (X) new Version 1.5 format
% (X) route calculated prompts, left/right, u-turns, roundabouts, straight/follow
% (X) arrival
% (X) other prompts: attention (without Type implementation), location lost, off_route, exceed speed limit
% ( ) special grammar: onto_street / on_street / to_street
% (N/A) special grammar: nominative/dativ for distance measure
% (N/A) special grammar: imperative/infinitive distincion for turns
% (X) distance measure: meters / feet / yard support
% (X) Street name announcement (suppress in prepare_roundabout)
% (X) Name announcement for destination / intermediate / GPX waypoint arrival
% (X) Time announcement for new and recalculated route (for recalculated suppress in appMode=car)
% ( ) word order checked


% ROUTE CALCULATED
string('route_is.ogg', 'Safani ni urefu wa ').
string('route_calculate.ogg', 'njia ya re-mahesabu').
string('distance.ogg', '. umbali ').

% LEFT/RIGHT
string('prepare.ogg', 'tayarisha ku ').
string('after.ogg', ' baada ya ').

string('left.ogg', 'geuka upande wa kushoto ').
string('left_sh.ogg', 'geuka sana upande wa kushoto ').
string('left_sl.ogg', 'geuka kiasi upande wa kushoto ').
string('right.ogg', 'geuka upande wa kulia ').
string('right_sh.ogg', 'geuka sana upande wa kulia ').
string('right_sl.ogg', 'geuka kiasi upande wa kulia ').
string('left_keep.ogg', 'kaa upande wa kushoto ').
string('right_keep.ogg', 'kaa upande wa kulia ').
% if needed, "left/right_bear.ogg" can be defined here also. "... (then) (bear_left/right)" is used in pre-announcements to indicate the direction of a successive turn AFTER the next turn.

% U-TURNS
string('prepare_make_uturn.ogg', 'Tayarisha kugeuka nyuma baada ya ').
string('make_uturn1.ogg', ' geuka nyuma ').
string('make_uturn2.ogg', 'Tafandali geuka kwa u turn ').
string('make_uturn_wp.ogg', 'wakati inawezekana, tafadhali kufanya u-kugeuka ').

% ROUNDABOUTS
string('prepare_roundabout.ogg', 'Tayarisha kuingia mzunguko baada ya ').
string('roundabout.ogg', ' ingia mzunguko, na uchukue upande wa ').
string('then.ogg', ', kisha ').
string('and.ogg', 'na ').
string('take.ogg', 'chukua upande wa ').
string('exit.ogg', 'kutoka').

string('1st.ogg', 'kwanza ').
string('2nd.ogg', 'pili ').
string('3rd.ogg', 'tatu ').
string('4th.ogg', 'nne ').
string('5th.ogg', 'tano ').
string('6th.ogg', 'sita ').
string('7th.ogg', 'saba ').
string('8th.ogg', 'nane ').
string('9th.ogg', 'tisa ').
string('10th.ogg', 'kumi ').
string('11th.ogg', 'kumi na moja ').
string('12th.ogg', 'kumi na mbili ').
string('13th.ogg', 'kumi na tatu ').
string('14th.ogg', 'kumi na nne ').
string('15th.ogg', 'kumi na tano ').
string('16th.ogg', 'kumi na sita ').
string('17th.ogg', 'kumi na saba ').

% STRAIGHT/FOLLOW
string('go_ahead.ogg', 'Endelea moja kwa moja mbele ').
string('follow.ogg', 'Endesha kwa ').

% ARRIVE
string('and_arrive_destination.ogg', 'na ufike kifiko ').
string('reached_destination.ogg', 'umefika ').
string('and_arrive_intermediate.ogg', 'na kufika katika yako kupitia-uhakika ').
string('reached_intermediate.ogg', 'wewe na kufikiwa yako kupitia-uhakika ').
string('and_arrive_waypoint.ogg', 'na kufika katika yako kupitia-uhakika GPX').
string('reached_waypoint.ogg', 'wewe na kufikiwa yako kupitia-uhakika GPX').

% OTHER PROMPTS
string('attention.ogg', 'makini, ').
string('location_lost.ogg', 'g p s ishara waliopotea ').
string('location_recovered.ogg', 'g p s signal restored ').
string('off_route.ogg', 'una jitenga na njia ').
string('exceed_limit.ogg', 'wewe ni mno kikomo kasi ').

% STREET NAME GRAMMAR
string('onto.ogg', 'kwenye ').
%string('on.ogg', 'on ').
%string('to.ogg', 'to ').

% DISTANCE UNIT SUPPORT
string('meters.ogg', 'mita').
string('around_1_kilometer.ogg', 'umbali wa kilomita moja ').
string('around.ogg', 'kuhusu ').
string('kilometers1.ogg', ' kilomita ').
string('kilometers2.ogg', ' kilometa ').

string('feet.ogg', 'futi ').
string('1_tenth_of_a_mile.ogg', 'moja ya kumi ya maili').
string('tenths_of_a_mile.ogg', 'sehemu ya kumi ya maili').
string('around_1_mile.ogg', 'kuhusu maili moja').
string('miles.ogg', 'maili ').

string('yards.ogg', 'yardi ').

% TIME SUPPORT
string('time.ogg', 'wakati zinahitajika').
string('1_hour.ogg', 'saa moja').
string('hours.ogg', 'masaa').
string('less_a_minute.ogg', 'chini ya dakika moja').
string('1_minute.ogg', 'dakika moja').
string('minutes.ogg', 'dakika ').


%% COMMAND BUILDING / WORD ORDER
turn('left', ['left.ogg']).
turn('left_sh', ['left_sh.ogg']).
turn('left_sl', ['left_sl.ogg']).
turn('right', ['right.ogg']).
turn('right_sh', ['right_sh.ogg']).
turn('right_sl', ['right_sl.ogg']).
turn('left_keep', ['left_keep.ogg']).
turn('right_keep', ['right_keep.ogg']).
bear_left(_Street) -- ['left_keep.ogg'].
bear_right(_Street) -- ['right_keep.ogg'].

onto_street('', []).
onto_street(Street, ['onto.ogg', Street]) :- tts.
onto_street(_Street, []) :- not(tts).
%on_street('', []).
%on_street(Street, ['on.ogg', Street]) :- tts.
%on_street(_Street, []) :- not(tts).
%to_street('', []).
%to_street(Street, ['to.ogg', Street]) :- tts.
%to_street(_Street, []) :- not(tts).

prepare_turn(Turn, Dist, Street) -- ['prepare.ogg', M, 'after.ogg', D | Sgen] :- distance(Dist) -- D, turn(Turn, M), onto_street(Street, Sgen).
turn(Turn, Dist, Street) -- ['after.ogg', D, M | Sgen] :- distance(Dist) -- D, turn(Turn, M), onto_street(Street, Sgen).
turn(Turn, Street) -- [M | Sgen] :- turn(Turn, M), onto_street(Street, Sgen).

prepare_make_ut(Dist, Street) -- ['prepare_make_uturn.ogg', D | Sgen] :- distance(Dist) -- D, onto_street(Street, Sgen).
make_ut(Dist, Street) --  ['after.ogg', D, 'make_uturn.ogg' | Sgen] :- distance(Dist) -- D, onto_street(Street, Sgen).
make_ut(Street) -- ['make_uturn.ogg' | Sgen] :- onto_street(Street, Sgen).
make_ut_wp -- ['make_uturn_wp.ogg'].

prepare_roundabout(Dist, _Exit, _Street) -- ['prepare_roundabout.ogg', D] :- distance(Dist) -- D.
roundabout(Dist, _Angle, Exit, Street) -- ['after.ogg', D, 'roundabout.ogg', E, 'exit.ogg' | Sgen] :- distance(Dist) -- D, nth(Exit, E), onto_street(Street, Sgen).
roundabout(_Angle, Exit, Street) -- ['take.ogg', E, 'exit.ogg' | Sgen] :- nth(Exit, E), onto_street(Street, Sgen).

go_ahead(Dist, Street) -- ['follow.ogg', D | Sgen] :- distance(Dist) -- D, onto_street(Street, Sgen).

then -- ['then.ogg'].
name(D, [D]) :- tts.
name(_D, []) :- not(tts).
and_arrive_destination(D) -- ['and_arrive_destination.ogg'|Ds] :- name(D, Ds).
reached_destination(D) -- ['reached_destination.ogg'|Ds] :- name(D, Ds).
and_arrive_intermediate(D) -- ['and_arrive_intermediate.ogg'|Ds] :- name(D, Ds).
reached_intermediate(D) -- ['reached_intermediate.ogg'|Ds] :- name(D, Ds).
and_arrive_waypoint(D) -- ['and_arrive_waypoint.ogg'|Ds] :- name(D, Ds).
reached_waypoint(D) -- ['reached_waypoint.ogg'|Ds] :- name(D, Ds).

route_new_calc(Dist, Time) -- ['route_is.ogg', D, 'time.ogg', T] :- distance(Dist) -- D, time(Time) -- T.
route_recalc(_Dist, _Time) -- ['route_calculate.ogg'] :- appMode('car').
route_recalc(Dist, Time) -- ['route_calculate.ogg', 'distance.ogg', D, 'time.ogg', T] :- distance(Dist) -- D, time(Time) -- T.

location_lost -- ['location_lost.ogg'].
location_recovered -- ['location_recovered.ogg'].
off_route(Dist) -- ['off_route.ogg', D] :- distance(Dist) -- D.
attention(_Type) -- ['attention.ogg'].
speed_alarm -- ['exceed_limit.ogg'].


%% 
nth(1, '1st.ogg').
nth(2, '2nd.ogg').
nth(3, '3rd.ogg').
nth(4, '4th.ogg').
nth(5, '5th.ogg').
nth(6, '6th.ogg').
nth(7, '7th.ogg').
nth(8, '8th.ogg').
nth(9, '9th.ogg').
nth(10, '10th.ogg').
nth(11, '11th.ogg').
nth(12, '12th.ogg').
nth(13, '13th.ogg').
nth(14, '14th.ogg').
nth(15, '15th.ogg').
nth(16, '16th.ogg').
nth(17, '17th.ogg').


%% command main method
%% if you are familar with Prolog you can input specific to the whole mechanism,
%% by adding exception cases.

flatten(X, Y) :- flatten(X, [], Y), !.
flatten([], Acc, Acc).
flatten([X|Y], Acc, Res):- flatten(Y, Acc, R), flatten(X, R, Res).
flatten(X, Acc, [X|Acc]) :- version(J), J < 100, !.
flatten(X, Acc, [Y|Acc]) :- string(X, Y), !.
flatten(X, Acc, [X|Acc]).

resolve(X, Y) :- resolve_impl(X,Z), flatten(Z, Y).
resolve_impl([],[]).
resolve_impl([X|Rest], List) :- resolve_impl(Rest, Tail), ('--'(X, L) -> append(L, Tail, List); List = Tail).


% handling alternatives
[X|_Y] -- T :- (X -- T),!.
[_X|Y] -- T :- (Y -- T).


pnumber(X, Y) :- tts, !, num_atom(X, Y).
pnumber(X, Ogg) :- num_atom(X, A), atom_concat(A, '.ogg', Ogg).
% time measure
hours(S, []) :- S < 60.
hours(S, ['1_hour.ogg']) :- S < 120, H is S div 60, pnumber(H, Ogg).
hours(S, [Ogg, 'hours.ogg']) :- H is S div 60, pnumber(H, Ogg).
time(Sec) -- ['less_a_minute.ogg'] :- Sec < 30.
time(Sec) -- [H] :- tts, S is round(Sec/60.0), hours(S, H), St is S mod 60, St = 0.
time(Sec) -- [H, '1_minute.ogg'] :- tts, S is round(Sec/60.0), hours(S, H), St is S mod 60, St = 1, pnumber(St, Ogg).
time(Sec) -- [H, Ogg, 'minutes.ogg'] :- tts, S is round(Sec/60.0), hours(S, H), St is S mod 60, pnumber(St, Ogg).
time(Sec) -- [Ogg, 'minutes.ogg'] :- not(tts), Sec < 300, St is Sec/60, pnumber(St, Ogg).
time(Sec) -- [H, Ogg, 'minutes.ogg'] :- not(tts), S is round(Sec/300.0) * 5, St is S mod 60, St > 0, hours(S, H), pnumber(St, Ogg).
time(Sec) -- [H] :- not(tts), S is round(Sec/300.0) * 5, hours(S, H), St is S mod 60.


%%% distance measure
distance(Dist) -- D :- measure('km-m'), distance_km(Dist) -- D.
distance(Dist) -- D :- measure('mi-f'), distance_mi_f(Dist) -- D.
distance(Dist) -- D :- measure('mi-y'), distance_mi_y(Dist) -- D.

%%% distance measure km/m
distance_km(Dist) -- ['meters.ogg', X]                   :- Dist < 100,   D is round(Dist/10.0)*10,           dist(D, X).
distance_km(Dist) -- ['meters.ogg', X]                   :- Dist < 1000,  D is round(2*Dist/100.0)*50,        dist(D, X).
distance_km(Dist) -- ['around_1_kilometer.ogg']          :- Dist < 1500.
distance_km(Dist) -- ['around.ogg', 'kilometers1.ogg', X] :- Dist < 10000, D is round(Dist/1000.0),            dist(D, X).
distance_km(Dist) -- ['kilometers2.ogg', X]              :-               D is round(Dist/1000.0),            dist(D, X).

%%% distance measure mi/f
distance_mi_f(Dist) -- ['feet.ogg', X]                   :- Dist < 160,   D is round(2*Dist/100.0/0.3048)*50, dist(D, X).
distance_mi_f(Dist) -- ['1_tenth_of_a_mile.ogg']         :- Dist < 241.
distance_mi_f(Dist) -- ['tenths_of_a_mile.ogg', X]       :- Dist < 1529,  D is round(Dist/161.0),             dist(D, X).
distance_mi_f(Dist) -- ['around_1_mile.ogg']             :- Dist < 2414.
distance_mi_f(Dist) -- ['around.ogg', 'miles.ogg', X]    :- Dist < 16093, D is round(Dist/1609.0),            dist(D, X).
distance_mi_f(Dist) -- ['miles.ogg', X]                  :-               D is round(Dist/1609.0),            dist(D, X).

%%% distance measure mi/y
distance_mi_y(Dist) -- ['yards.ogg', X]                  :- Dist < 241,   D is round(Dist/10.0/0.9144)*10,    dist(D, X).
distance_mi_y(Dist) -- ['yards.ogg', X]                  :- Dist < 1300,  D is round(2*Dist/100.0/0.9144)*50, dist(D, X).
distance_mi_y(Dist) -- ['around_1_mile.ogg']             :- Dist < 2414.
distance_mi_y(Dist) -- ['around.ogg', 'miles.ogg', X]    :- Dist < 16093, D is round(Dist/1609.0),            dist(D, X).
distance_mi_y(Dist) -- ['miles.ogg', X]                  :-               D is round(Dist/1609.0),            dist(D, X).


interval(St, St, End, _Step) :- St =< End.
interval(T, St, End, Step) :- interval(Init, St, End, Step), T is Init + Step, (T =< End -> true; !, fail).

interval(X, St, End) :- interval(X, St, End, 1).

string(Ogg, A) :- voice_generation, interval(X, 1, 19), atom_number(A, X), atom_concat(A, '.ogg', Ogg).
string(Ogg, A) :- voice_generation, interval(X, 20, 95, 5), atom_number(A, X), atom_concat(A, '.ogg', Ogg).
string(Ogg, A) :- voice_generation, interval(X, 100, 900, 50), atom_number(A, X), atom_concat(A, '.ogg', Ogg).
string(Ogg, A) :- voice_generation, interval(X, 1000, 9000, 1000), atom_number(A, X), atom_concat(A, '.ogg', Ogg).

dist(X, Y) :- tts, !, num_atom(X, Y).

dist(0, []) :- !.
dist(X, [Ogg]) :- X < 20, !, pnumber(X, Ogg).
dist(X, [Ogg]) :- X < 1000, 0 is X mod 50, !, num_atom(X, A), atom_concat(A, '.ogg', Ogg).
dist(D, ['20.ogg'|L]) :-  D < 30, Ts is D - 20, !, dist(Ts, L).
dist(D, ['30.ogg'|L]) :-  D < 40, Ts is D - 30, !, dist(Ts, L).
dist(D, ['40.ogg'|L]) :-  D < 50, Ts is D - 40, !, dist(Ts, L).
dist(D, ['50.ogg'|L]) :-  D < 60, Ts is D - 50, !, dist(Ts, L).
dist(D, ['60.ogg'|L]) :-  D < 70, Ts is D - 60, !, dist(Ts, L).
dist(D, ['70.ogg'|L]) :-  D < 80, Ts is D - 70, !, dist(Ts, L).
dist(D, ['80.ogg'|L]) :-  D < 90, Ts is D - 80, !, dist(Ts, L).
dist(D, ['90.ogg'|L]) :-  D < 100, Ts is D - 90, !, dist(Ts, L).
dist(D, ['100.ogg'|L]) :-  D < 200, Ts is D - 100, !, dist(Ts, L).
dist(D, ['200.ogg'|L]) :-  D < 300, Ts is D - 200, !, dist(Ts, L).
dist(D, ['300.ogg'|L]) :-  D < 400, Ts is D - 300, !, dist(Ts, L).
dist(D, ['400.ogg'|L]) :-  D < 500, Ts is D - 400, !, dist(Ts, L).
dist(D, ['500.ogg'|L]) :-  D < 600, Ts is D - 500, !, dist(Ts, L).
dist(D, ['600.ogg'|L]) :-  D < 700, Ts is D - 600, !, dist(Ts, L).
dist(D, ['700.ogg'|L]) :-  D < 800, Ts is D - 700, !, dist(Ts, L).
dist(D, ['800.ogg'|L]) :-  D < 900, Ts is D - 800, !, dist(Ts, L).
dist(D, ['900.ogg'|L]) :-  D < 1000, Ts is D - 900, !, dist(Ts, L).
dist(D, ['1000.ogg'|L]):- Ts is D - 1000, !, dist(Ts, L).
