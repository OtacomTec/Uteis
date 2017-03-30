unit Funcoes_ECF;

interface

implementation
    function Bematech_FI_LeituraX(): Integer; StdCall; External 'BEMAFI32.DLL';
end.
