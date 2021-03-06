############################################################################
##
##  print.g                            CRISP                Burkhard Höfling
##
##  Copyright © 2000 Burkhard Höfling
##
LogTo("test.log");
START_TEST("print");
LoadPackage("crisp", "", false);
CRISP_Read("tst/samples.g");

if PRINT_METHODS then
    TraceMethods(PrintObj, ViewObj);
fi;

old := fail;
cl := classes(); 
for i in [1..Length(cl)] do
    View(cl[i]);
    Print("\n",cl[i], "\n");
    for j in [i+1..Length(cl)] do
        I := Intersection(cl[i], cl[j]);
        View(I);
        Print("\n", I, "\n");
    od;
od;
for C in cl do
    SetIsOrdinaryFormation(C, true);
od;
for C in cl do
    for D in cl do
        P := FormationProduct(C, D);
        View(P);
        Print("\n", P, "\n");
    od;
od;
cl := classes(); 
for C in cl do
    SetIsFittingClass(C, true);
od;
for C in cl do
    for D in cl do
        P := FittingProduct(C, D);
        View(P);
        Print("\n", P, "\n");
    od;
od;

if PRINT_METHODS then
    UnTraceMethods(PrintObj, ViewObj);
fi;
STOP_TEST("print", 0);


############################################################################
##
#E
##
