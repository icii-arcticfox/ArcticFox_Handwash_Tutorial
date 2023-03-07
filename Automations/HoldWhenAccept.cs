using ArcticFoxBasic.Automations;

namespace Handwash_ArcticFoxBlog;

public class HoldWhenAccept : VerilogAutomation
{
	//Dependencies are conditions/values that must be determined before an automation
	//can be processed. In other words, before ApplyAutomation can be run.
    protected override Dependencies Dependencies => new Dependencies
	{
		//Need to wait until the clock has been set for the module with the Clock automation
		Module.PrimaryClockSet,

		//Similary, wait until the Reset automation has been set for the module
		Reset.Set[Module]
	};

	//The ApplyAutomation function is what is called when we evaluate an automation.
	//ApplyAutomation can be a small function, other times the function can get large.
	protected override void ApplyAutomation()
	{
		//We want to use the name of the attached reg, so get the next reg. An attached
		//reg, wire, paramter, module, etc. is the item in Verilog that follows the Automation.
		//Multiple automations can be attached to the same item.
		Reg reg = NextReg(forceToReg: true);

		//We assume that the attached reg has the same name as an incoming signal, 
		//plus the suffix "Held". To get the name of the incoming signal then, 
		//we need to remove the word Held form the next reg's name.  
		string incomingSignal = reg.Name.Replace("Held", "");

//_***Step 2) Below, we are generating code and adding it to the module. This is the
//_***first tutorial where we guide you through creating an automation, so 
//_***we have given you most of the code. In C#, you can do string interpolation
//_***quite easily - one of the reasons we chose C# as the backend. A string 
//_***with the format $"" or @$"", as below, enable you to put variables in the
//_***string if encapsulated by { variableName }. 
//_*** 
//_***Below, we've left two spots for you to fill in. The first, we are accepting
//_***the incoming signal. Replace the first /*???*/ with what will evaluate to 
//_***the name of the incoming signal. 
//_*** 
//_***For the second spot, we want the reg to hold its own value. Replace the 
//_***second /*???*/ with what will evaluate to the name of the attached reg. 
		CodeAfterNext += @$"
always@(posedge {Module.PrimaryClock})  begin
    {Reset.IfReset(Module, $"{reg.Name} <= 0;")
	}if(accept{incomingSignal.UpperFirstLetter()})
		{reg.Name} <= {/*???*/};
    else
		{reg.Name} <= {/*???*/};
end
		";
		
		
//_***DIFFERENT FILE - Continue to Step3_Calculate. Move to HandwashSensor.v


		//To give a little more detail on how/where to generate Verilog, you can use the 
		//following Code objects to add Verilog code. These can be used in the ApplyAutomation
		//function as seen above. 
		//
		// CodeAfterAutomation - Adds code directly after the automation 
        // CodeAfterNext - Adds code directly after the next item
        // CodeModuleEnd - Adds code to the end of the module
        // CodeModuleStart - Adds code to the start of the module
		//
		//
		//To go a little deeper, there are also helper functions that work outside of 
		//ApplyAutomation that do similar functions. 
		//
		// AddToModuleAfterAutomation(...)
		// AddToModuleAfterNext(...)
		// AddToModuleEnd(...)
		// AddToModuleStart(...)
		// AddToModulePortList(...)
	}
}