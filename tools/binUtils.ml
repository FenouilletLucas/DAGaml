type stream  = bool list
type 't dump = 't -> stream -> stream
type 't load = stream -> 't  * stream
