person(andrew).
person(karen).
person(dudley).
person(georgina).

alien(jarix).
alien(wattin).
alien(gribbet).
alien(flubsub).

skill(bubbles).
skill(colors).
skill(eyes).
skill(fins).

solve :-
	alien(AndrewAlien), alien(KarenAlien), alien(DudleyAlien), alien(GeorginaAlien),
	all_different([AndrewAlien, KarenAlien, DudleyAlien, GeorginaAlien]),

	skill(AndrewSkill), skill(KarenSkill), skill(DudleySkill), skill(GeorginaSkill),
	all_different([AndrewSkill, KarenSkill, DudleySkill, GeorginaSkill]),

	Triples = [ [andrew, AndrewAlien, AndrewSkill],
			[karen, KarenAlien, KarenSkill],
			[dudley, DudleyAlien, DudleySkill],
			[georgina, GeorginaAlien, GeorginaSkill] ],

	\+ member([dudley, flubsub, _], Triples),
	\+ member([dudley, jarix, _], Triples),
	\+ member([dudley,_, fins], Triples),

	\+ member([andrew, jarix, _], Triples),
    member([_,jarix,eyes], Triples),

	member([karen, wattin, _], Triples),

	\+ member([andrew,_,fins], Triples),
	\+ member([dudley,_,bubbles], Triples),

	tell(andrew, AndrewAlien, AndrewSkill),
	tell(karen, KarenAlien, KarenSkill),
	tell(dudley, DudleyAlien, DudleySkill),
	tell(georgina, GeorginaAlien, GeorginaSkill).

all_different([H | T]) :- member(H,T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).

tell(X,Y,Z) :-
	write(X), write(' has the toy '), write(Y), write(' which has the skill '), write(Z), nl.


 

