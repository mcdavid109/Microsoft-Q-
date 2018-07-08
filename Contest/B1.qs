namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            let N = Length(qs);
            for(i in 0..N-2){
                CNOT(qs[i] , qs[i+1]);
            }
            if(M(qs[N-1]) == Zero){
                return 0;
            }
            return 1;
        }
    }
}
