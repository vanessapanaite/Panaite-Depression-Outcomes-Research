* Encoding: UTF-8.
*

RECODE Task ('Rate positive event'=0) ('Rate positive affect'=2) ('Rate negative event'=-1) 
    ('Rate stressful event'=-2) ('Rate negative affect'=1) INTO TaskNum.
EXECUTE.


***ratings of unpleasantness, stressfulness relative to negative affect

USE ALL.
COMPUTE filter_$=(TaskNum = -2 OR TaskNum = -1 OR TaskNum = 1).
VARIABLE LABELS filter_$ 'TaskNum = -2 OR TaskNum = -1 OR TaskNum = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

MIXED rating with tasknum group
  /FIXED=tasknum  group  tasknum*group  | SSTYPE(3)
  /METHOD=REML
  /RANDOM=INTERCEPT  | SUBJECT(PID) COVTYPE(UN)
  /PRINT = solution TESTCOV.

MIXED rating by tasknum with group
  /FIXED=tasknum  group  tasknum*group  | SSTYPE(3)
  /METHOD=REML
  /RANDOM=INTERCEPT  | SUBJECT(PID) COVTYPE(UN)
  /PRINT = solution TESTCOV.


***ratings of pleasantness relative to positive affect

USE ALL.
COMPUTE filter_$=(TaskNum = 0 OR TaskNum = 2).
VARIABLE LABELS filter_$ 'TaskNum = 0 OR TaskNum = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

MIXED rating with tasknum group
  /FIXED=tasknum  group  tasknum*group  | SSTYPE(3)
  /METHOD=REML
  /RANDOM=INTERCEPT  | SUBJECT(PID) COVTYPE(UN)
  /PRINT = solution TESTCOV.

MIXED rating by tasknum with group
  /FIXED=tasknum  group  tasknum*group  | SSTYPE(3)
  /METHOD=REML
  /RANDOM=INTERCEPT  | SUBJECT(PID) COVTYPE(UN)
  /PRINT = solution TESTCOV.



***WITHIN GROUP ANALYSES*************
    
**follow-up models****

***ratings of unpleasantness, stressfulness relative to negative affect

USE ALL.
COMPUTE filter_$=(TaskNum = -2 OR TaskNum = -1 OR TaskNum = 1).
VARIABLE LABELS filter_$ 'TaskNum = -2 OR TaskNum = -1 OR TaskNum = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


MIXED rating by tasknum
  /FIXED=tasknum  | SSTYPE(3)
  /METHOD=REML
  /RANDOM=INTERCEPT  | SUBJECT(PID) COVTYPE(UN)
  /PRINT = solution TESTCOV.


***ratings of pleasantness relative to positive affect

USE ALL.
COMPUTE filter_$=(TaskNum = 0 OR TaskNum = 2).
VARIABLE LABELS filter_$ 'TaskNum = 0 OR TaskNum = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


MIXED rating by tasknum 
  /FIXED=tasknum    | SSTYPE(3)
  /METHOD=REML
  /RANDOM=INTERCEPT  | SUBJECT(PID) COVTYPE(UN)
  /PRINT = solution TESTCOV.


