############################################################################
##
##  injectors.g                        CRISP                Burkhard Höfling
##
##  Copyright © 2000 Burkhard Höfling
##
LoadPackage("crisp");
CRISP_Read("tst/samples.g");

if PRINT_METHODS then
    TraceMethods(InjectorOp);
fi;

for G in groups do
    Info(InfoTest, 1, G());
    old := fail;
    cl := classes(); 
    for C in cl do
        SetIsFittingClass(C, true);
    od;
    for i in [1..Length(cl)] do
        if InfoLevel(InfoTest) >= 2 then
            View(cl[i]);
            Print("\n");
        fi;
        new := Size(Injector(G(), cl[i]));
        if old = fail then
            old := new;
        elif old <> new then
            Error("different results");
        fi;
        for j in [i..Length(cl)] do
            I := Intersection(cl[i], cl[j]);
            if InfoLevel(InfoTest) >= 3 then
                View(I);
                Print("\n");
            fi;
            new := Size(Injector(G(), I));
            if old <> new then
                Error("different results");
            fi;
        od;
    od;
    for C in cl do
        for D in cl do
            P := FittingProduct(C, D);
            if InfoLevel(InfoTest) >= 3 then
                View(C, "by", D);
                Print("\n");
            fi;
            new := Size(Injector(G(), P));
            if old <> new then
                Error("different results");
            fi;
        od;
    od;
od;

if PRINT_METHODS then
    UnTraceMethods(InjectorOp);
fi;


############################################################################
##
#E
##
