`timescale 1ns / 1ps

module processor_tb;
    reg clk = 0;
    reg reset = 1;

    top dut (.clk(clk), .reset(reset));

    always #5 clk = ~clk;

    initial begin
        $dumpfile("processor_tb.vcd");
        $dumpvars(0, processor_tb);
        #12 reset = 0;
        repeat (10) @(posedge clk);
        #1;

        if (dut.Reg_file.Registers[1] !== 32'd5)  $fatal(1, "x1 expected 5");
        if (dut.Reg_file.Registers[2] !== 32'd7)  $fatal(1, "x2 expected 7");
        if (dut.Reg_file.Registers[3] !== 32'd12) $fatal(1, "x3 expected 12");
        if (dut.Reg_file.Registers[4] !== 32'd12) $fatal(1, "x4 expected 12");
        if (dut.Reg_file.Registers[5] !== 32'd2)  $fatal(1, "branch did not skip x5 = 1");
        if (dut.DM.Data_Memory[0] !== 32'd12)     $fatal(1, "memory[0] expected 12");
        if (dut.Reg_file.Registers[0] !== 32'd0)  $fatal(1, "x0 must remain zero");

        $display("PASS: processor program completed successfully.");
        $finish;
    end
endmodule
