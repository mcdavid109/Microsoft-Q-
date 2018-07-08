namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (N : Int, Uf : ((Qubit[], Qubit) => ())) : Bool
    {
        body
        {
            mutable res = new Result[N];
            using(qbit = Qubit[N+1]){
                X(qbit[N]);
                ApplyToEach(H , qbit);
                Uf(qbit[0..N-1] , qbit[N]);
                ApplyToEach(H , qbit[0..N-1]);
                for(i in 0..N-1){
                    set res[i] = M(qbit[i]);
                }
                ResetAll(qbit);
            }
            return ForAll(IsResultZero , res);
        }
    }
}
