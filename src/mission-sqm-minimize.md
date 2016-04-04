Minimize Mission.sqm File, according to certain Rules
===

[REGEX] Change Position of everything to [0,0,0]
---

```
position\[\]=\{.*\};
position[]={0,0,0};
```

[REGEX] Change Skill from 0.600000x to 0.6
---

```
skill=0\.60*.;
skill=0.6;
```

[MANUAL] Remove addOns[] and addOnsAuto[] dependencies
---
These are not needed, and may only cause problems on Custom Maps.

[MANUAL] Set File from CRLF to LF only.
---
This saves a bit more space in the File.

[REGEX] Remove all Indentation Tabs at the beginning of the Line.
```
^\t*
<Empty>
```