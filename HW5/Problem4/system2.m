function zprimeest=system2(t,z)
    B = [1;0;0];
    %observer =[3,155,1;-3,-38,0;1,346,0]
    %observer = [3 13 1; -3 -9 0; 1 5 0];
    observer = [3 960 1; -3 -93 0; 1 8031 0];
    zprimeest = observer*(z*T- + B;
end