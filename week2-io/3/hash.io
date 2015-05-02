OperatorTable addAssignOperator(":", "atPutAttribute")
Map atPutAttribute := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1)
  )
)

curlyBrackets := method(r := Map clone; call message arguments foreach(arg, r doMessage(arg)); r)
