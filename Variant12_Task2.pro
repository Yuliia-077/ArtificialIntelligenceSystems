domains
first_dish = string
second_dish = string
third_dish = string

facts
single count(integer)

predicates
nondeterm lunch(first_dish, second_dish, third_dish)
nondeterm do(string, string)

goal
do("steak","tea").

clauses
count(0).
lunch("soup", "steak", "compote").
lunch("soup", "steak", "tea").
lunch("soup", "chicken", "compote").
lunch("soup", "chicken", "tea").
lunch("soup", "fish", "compote").
lunch("soup", "fish", "tea").
lunch("borsch", "steak", "compote").
lunch("borsch", "steak", "tea").
lunch("borsch", "chicken", "compote").
lunch("borsch", "chicken", "tea").
lunch("borsch", "fish", "compote").
lunch("borsch", "fish", "tea").

do(Second, Third):-
	lunch(F, S, T),
	S = Second,
	T = Third,
	write(F, " ", S, " ", T), nl,
	count(N),N1=N+1,
	assert(count(N1)), nl,
	fail.
	
do(_, _):-
	count(N),write(N).

	
