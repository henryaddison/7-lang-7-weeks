"Hello, World!" println

MyObject := Object clone 

MyObject forward := method(
  write("sender = ", call sender, "\n")
  write("message name = ", call message name, "\n")
  args := call message argsEvaluatedIn(call sender)
  args foreach(i, v, write("arg", i, " = ", v, "\n") )
)

MyObject hello(1,2, "hello")



Dog := Object clone
Dog bark := method(writeln("woof!"))

fido := Dog clone
fido bark := method(
  writeln("ruf!")
  resend
)