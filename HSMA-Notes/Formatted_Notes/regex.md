# Various regex patterns. 
### vs code uses javascript style regex

## Finding something within quotes


```javascript
\s*"([^"]*)"
```
\s = any white space

\* = any amount of preceding

 " = literal "

() = make this a group, held in $1 (or \1 if it is python)

[] = character set

^" = NOT a literal "

\* = any amount of preceding, in this case NOT a literal "

 " = literal "


and if you want to substitute use

("$1")
