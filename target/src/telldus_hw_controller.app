%% This is the application resource file (.app file) for the 'base'
%% application.
{application, telldus_hw_controller,
[{description, "Tellstick to control switch and sensord " },
{vsn, "0.0.1" },
{modules, 
	  [telldus_hw_controller_app,telldus_hw_controller_sup,telldus_hw_controller,mod_telldus_hw_controller]},
{registered,[telldus_hw_controller]},
{applications, [kernel,stdlib]},
{mod, {telldus_hw_controller_app,[]}},
{start_phases, []}
]}.
