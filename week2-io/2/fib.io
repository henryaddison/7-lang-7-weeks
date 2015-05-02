Fib := Object clone

Fib recur := method(n, if(n == 1, 1, if(n == 2, 1, Fib recur(n-2)+Fib recur(n-1))))

Fib loop := method(n, 
  recent_values := list(0,1)
  while(n>1, 
    recent_values = list(recent_values at(1), recent_values sum)
    n = n-1
  )
  recent_values at(1)
)

Fib loop(7) println
