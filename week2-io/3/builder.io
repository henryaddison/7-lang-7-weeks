doFile("hash.io")

Builder := Object clone

Builder indentation_count := 0

Builder forward := method(
  indentation := ""
  indentation_count repeat(
    indentation = indentation .. " "
  )
  
  argList := call message arguments

  opening := indentation .. "<" .. (call message name )
  writeln(argList at(0))
  if(argList at(0) type == "Map",
    writeln("hello")
    attribute_map := argList pop
    attribute_map foreach(key, value,
      opening = " " ..opening .. key .. "=" .. '"' .. value .. '"'
    )
  )

  opening = opening .. ">"
  writeln(opening)

  argList foreach(
    arg,
    indentation_count = indentation_count + 2;
    content := self doMessage(arg); 
    if(content type == "Sequence", writeln(indentation .. "  " .. content))
    indentation_count = indentation_count - 2;
  )
  writeln(indentation, "</", call message name, ">")
)

Builder ul({"id": "languages"})
