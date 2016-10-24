`timescale 1ns / 1ps

module logicblock(
    input logic op1,
    input logic op2,
    input logic [2:0] opsel,
    output result_L,
    output cout_L
    );
    
    //first mux output Result_L
    assign result_L = (opsel==3'b000)?(op1&op2):
                      (opsel==3'b001)?(op1|op2):
                      (opsel==3'b010)?(op1^op2):
                      (opsel==3'b011)?(~op1)   :
                      1'bz;
                      /* (opsel==3'b101)? 1'bz; what do i do about carry in*/
                      
    //second carry mux output cout_L
    assign cout_L = (opsel==3'b000)? 0:
                    (opsel==3'b001)? 0:
                    (opsel==3'b010)? 0:
                    (opsel==3'b011)? 0:
                    (opsel==3'b101)? op1 : 1'bz; // unsure about 1'bz
endmodule