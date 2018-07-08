namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            CNOT(qs[0] , qs[1]);
            H(qs[0]);
            H(qs[1]);
            if(M(qs[0]) == Zero){
                if(M(qs[1]) == Zero){
                    return 0;
                }
                return 3;
            }
            if(M(qs[1]) == One){
                return 1;
            }
            return 2;
        }
    }
}
