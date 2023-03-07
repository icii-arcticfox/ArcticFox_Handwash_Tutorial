module HandwashSensor(

//***Step 1a) Add a clock automation, since the sensor doesn't need to be fast, we suggest a 10 MHz clock 
    /*[Clock 10 MHz]*/
    input clk,

//***Step 1b) Add a reset automation
    /*[Reset]*/
    input reset,

    input acceptLeftHandDistance,
    input [15:0] leftHandDistance,

    input acceptLeftHandGain,
    input [7:0] leftHandGain,

    input acceptRightHandDistance,
    input [15:0] rightHandDistance,

    input acceptRightHandGain,
    input [7:0] rightHandGain,

    output waterOn
);

//***Step 1c) For the next 4 regs, leftHandDistanceHeld, leftHandGainHeld, rightHandDistanceHeld, and rightHandGainHeld,
//***add a HoldWhenAccept automation with no items. We are going to make a custom automation! 
/*[HoldWhenAccept]*/ reg [15:0] leftHandDistanceHeld;
/*[HoldWhenAccept]*/ reg [7:0] leftHandGainHeld;
/*[HoldWhenAccept]*/ reg [15:0] rightHandDistanceHeld;
/*[HoldWhenAccept]*/ reg [7:0] rightHandGainHeld;


endmodule
