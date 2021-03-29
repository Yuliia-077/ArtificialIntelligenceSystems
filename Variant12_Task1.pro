% Copyright
domains
title = string
price = real
age = integer 
list_price = real*

predicates
nondeterm toy(title, price, age)
nondeterm summa(list_price, real, integer)
nondeterm average_price

goal
average_price.

clauses
toy("doll", 100.00, 5).
toy("bear", 200.00, 7).
toy("barby", 300.00, 6).
toy("car", 150.00, 4).
toy("cat", 276.00, 3).
toy("lola", 500.00, 6).
toy("kitchen", 1000.00, 5).
toy("lego", 600.00, 7).
toy("train", 450.00, 2).

average_price:-
findall (Price, toy(_, Price, _), List_price),
        summa(List_price, Summa, Quantity),
        write("Summa prices of toys = ", Summa),
        Average = Summa/Quantity,
        write("\nAverage price of toys = ", Average),
        write("\n").
        
summa([], 0.0, 0).
summa([X|Y], S, Q):-
summa(Y, S1, Q1), S=S1+X, Q=Q1+1.