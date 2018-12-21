" Vim syntax file for pbrt scene description files
" see: https://pbrt.org/fileformat-v3.html
" created by Jan Kiene

if exists("b:current_syntax")
  finish
endif

" keywords
syn keyword pbrtKeywords Accelerator ActiveTransform All AreaLightSource Camera ConcatTransform CoordinateSystem CoordSysTransform EndTime Film Identity Integrator LightSource LookAt Material ObjectInstance PixelFilter ReverseOrientation Rotate Sampler Scale Shape StartTime Texture Transform TransformTimes Translate TransformBegin TransformEnd WorldBegin WorldEnd AttributeBegin AttributeEnd ObjectBegin ObjectEnd
syn keyword pbrtDataType integer float point2 vector2 point3 vector3 normal3 spectrum bool string point vector normal
syn keyword pbrtInclude Include
syn keyword pbrtBoolean true false
syntax region pbrtString start=/"/ end=/"/ oneline contains=pbrtDataType
syntax region pbrtComment start=/#/ end=/$/ oneline
syntax region pbrtList start='\[' end='\]' contains=pbrtString,pbrtNumber
syntax match pbrtNumber "\v<\d+>"
syntax match pbrtNumber "\v<\d+\.\d+>"

syntax region makeNamed start=/MakeNamed\(Medium \|Material \)/ end=/ / oneline contains=varName
syntax region varName start=/"/ end=/"/ oneline contained containedin=makeNamed
syntax region namedMaterial start=/NamedMaterial / end=/ / contains=varName
syntax region mediumInterface start=/MediumInterface / end=/ / contains=varName

" highlighting
highlight default link pbrtKeywords Keyword
highlight default link pbrtDataType Type
highlight default link pbrtString String
highlight default link pbrtComment Comment
highlight default link pbrtList Delimiter
highlight default link pbrtNumber Number
highlight default link pbrtBoolean Boolean
highlight default link pbrtInclude PreProc

highlight default link makeNamed Keyword
highlight default link namedMaterial Keyword
highlight default link mediumInterface Keyword
highlight default link varName Identifier
highlight default link twoVarName Special

let b:current_syntax = "pbrt"
