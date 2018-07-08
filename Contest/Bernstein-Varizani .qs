namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (N : Int, Uf : ((Qubit[], Qubit) => ())) : Int[]
    {
        body
        {
            mutable res = new Int[N];
            using(qbit = Qubit[N+1]){
                X(qbit[N]);
                ApplyToEach(H , qbit);
                Uf(qbit[0..N-1] , qbit[N]);
                ApplyToEach(H , qbit[0..N-1]);
                for(i in 0..N-1){
                    if(M(qbit[i]) == Zero){
                        set res[i] = 0;
                    }
                    else{
                       set res[i] = 1;
                    }
                }
                ResetAll(qbit);
            }
            return res;
        }
    }
}
