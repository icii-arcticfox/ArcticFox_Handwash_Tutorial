//S***Conclusion
//***Congrats, you've finished the Arctic Fox Handwash tutorial! We've removed
//***the explainer text so you can see the conciseness of Arctic Fox. We hope you've
//***enjoyed Arctic Fox! Next, try the another tutorial or play around in the
//***Arctic Fox sandbox!

module HandwashSensor(

    /*[Clock 10 MHz]*/
    input clk,

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

/*[HoldWhenAccept]*/ reg [15:0] leftHandDistanceHeld;
/*[HoldWhenAccept]*/ reg [7:0] leftHandGainHeld;
/*[HoldWhenAccept]*/ reg [15:0] rightHandDistanceHeld;
/*[HoldWhenAccept]*/ reg [7:0] rightHandGainHeld;



/*[Calculate leftHandDistanceHeld * leftHandGainHeld >> 7]*/
wire [15:0] leftHand;

/*[Calculate rightHandDistanceHeld * rightHandGainHeld >> 7]*/
wire [15:0] rightHand;

parameter threshold = 1500;
assign waterOn = leftHand != 0 && rightHand != 0 && (leftHand < threshold || rightHand < threshold);

endmodule
