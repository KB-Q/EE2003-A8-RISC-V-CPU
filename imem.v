`timescale 1ns/1ps
`define TESTDIR "t1"                 //Define TESTDIR as the t1 directory from A6.

module imem ( input [31:0] iaddr,
              output [31:0] idata
            );

    // Ignores LSB 2 bits, so will not generate alignment exception
    reg [31:0] mem[0:4095]; // Define a 4-K location memory (16KB)
    
    // initialise memory
    initial
        $readmemh({`TESTDIR,"/idata.mem"},mem);

    // read instruction at required location
    assign idata = mem[iaddr[13:2]];

endmodule
