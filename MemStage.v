`timescale 1ns / 1ps

module MemStage (

		input clock,
		input reset,

		input [31:0] aluOutput,
		input shouldWriteMemory,
		input [31:0] registerRtOrZero,
		output [31:0] memoryData
	);

	DataMemory dataMemory(
		.clka(~clock),
		// FIXME: Should be [9:2], but this will stall pc for unknown reason.
		.addra(aluOutput[7:0]),
		.douta(memoryData[31:0]),
		.wea(shouldWriteMemory),
		.dina(registerRtOrZero[31:0])
	);
endmodule
