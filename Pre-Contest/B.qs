namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[], index : Int) : ()
    {
        body
        {
           
            if(index == 1){
                Set(qs[0] , One);
            }

            elif(index == 2){
                Set(qs[1] , One);
            }
            elif(index == 3){
                Set(qs[0] , One);
                Set(qs[1] , One);
            } 
            H(qs[0]);
            CNOT(qs[0] , qs[1]);

                
        }
    }

    operation Set (q1: Qubit , desired: Result) : ()
    {
        body
        {
            let current = M(q1);
            if (desired != current)
            {
                X(q1);
            }
        }
    }
}
