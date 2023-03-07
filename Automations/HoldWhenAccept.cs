using ArcticFoxBasic.Automations;

namespace Handwash_ArcticFoxBlog;

public class HoldWhenAccept : VerilogAutomation
{
    protected override Dependencies Dependencies => new Dependencies
	{
		Module.PrimaryClockSet,
		Reset.Set[Module]
	};

	protected override void ApplyAutomation()
	{
		Reg reg = NextReg(forceToReg: true);
		string incomingSignal = reg.Name.Replace("Held", "");

		CodeAfterNext += @$"
always@(posedge {Module.PrimaryClock})  begin
    {Reset.IfReset(Module, $"{reg.Name} <= 0;")
	}if(accept{incomingSignal.UpperFirstLetter()})
		{reg.Name} <= {incomingSignal};
    else
		{reg.Name} <= {reg.Name};
end
		";
	}
}